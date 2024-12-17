import 'package:telepatia/features/voice_record/domain/repositories/recording_repository.dart';

class RecordingUseCase {
  final RecordingRepository _recordingRepository;

  RecordingUseCase(this._recordingRepository);

  Future<Map<String, dynamic>> getRecording() async {
    return _recordingRepository.getRecording();
  }

  Future<Map<String, dynamic>> saveRecording(
      Map<String, dynamic> recording) async {
    return _recordingRepository.saveRecording(recording);
  }
}
