import 'package:telepatia/features/voice_record/data/repositories_impl/recording_repository_impl.dart';
import 'package:telepatia/features/voice_record/domain/repositories/recording_repository.dart';

class RecordingUseCase {
  final RecordingRepository _recordingRepository;

  RecordingUseCase() : _recordingRepository = RecordingRepositoryImpl();

  Future<List<String>> getAudioFilesList() async {
    return _recordingRepository.getAudioFilesList();
  }
}
