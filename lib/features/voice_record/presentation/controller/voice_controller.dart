import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:telepatia/features/voice_record/domain/usecases/recording_usecase.dart';
import 'package:telepatia/features/voice_record/presentation/controller/voice_state.dart';
import 'package:path/path.dart' as path;
part 'voice_controller.g.dart';

@riverpod
class VoiceController extends _$VoiceController {
  @override
  VoiceState build() {
    return VoiceState.initial();
  }

  final _storage = FirebaseStorage.instance;
  final _audioPlayer = AudioPlayer();
  final _audioRecorder = AudioRecorder();
  final _recordingUseCase = RecordingUseCase();

  Future<void> getAudioFilesList() async {
    try {
      final result = await _recordingUseCase.getAudioFilesList();
      state = state.copyWith(audioFilesList: result);
    } catch (e) {
      log('Error fetching audio files: $e');
      state = state.copyWith(audioFilesList: []);
    }
  }

  Future<String> uploadFile(String filePath, String fileName) async {
    final storageRef = _storage.ref().child('voice_notes/$fileName');

    state = state.copyWith(isUploading: true, uploadProgress: 0.0);

    final uploadTask = storageRef.putFile(File(filePath));

    uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
      double progress = snapshot.bytesTransferred / snapshot.totalBytes;
      state = state.copyWith(uploadProgress: progress);
    });

    await uploadTask;
    state = state.copyWith(isUploading: false);

    final downloadUrl = await storageRef.getDownloadURL();
    return downloadUrl;
  }

  Future<void> playAudio(String url) async {
    state = state.copyWith(isPlaying: true);
    await _audioPlayer.setUrl(url);
    await _audioPlayer.play();
  }

  void stopAudio() async {
    await _audioPlayer.stop();
    state = state.copyWith(isPlaying: false);
  }

  Future<void> recordAudio() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final String filePath = path.join(dir.path, 'audio.mp4');
    await _audioRecorder.start(const RecordConfig(), path: filePath);
    state = state.copyWith(isRecording: true, filePath: filePath);
  }

  Future<void> stopRecordAudio() async {
    await _audioRecorder.stop();
    state = state.copyWith(isRecording: false);
    if (state.filePath != null) {
      try {
        String fileName = 'audio_${DateTime.now().millisecondsSinceEpoch}.mp4';

        String downloadUrl = await uploadFile(state.filePath!, fileName);

        state = state.copyWith(downloadUrl: downloadUrl);

        log('file uploaded: $downloadUrl');
      } catch (e) {
        log('failed to upload file: $e');
      }
    }
  }
}
