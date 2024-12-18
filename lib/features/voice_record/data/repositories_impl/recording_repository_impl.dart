import 'package:telepatia/features/voice_record/data/datasources/recording_service_datasource.dart';
import 'package:telepatia/features/voice_record/domain/repositories/recording_repository.dart';

class RecordingRepositoryImpl implements RecordingRepository {
  final RecordingServiceDataSource _recordingServiceDataSource;

  RecordingRepositoryImpl()
      : _recordingServiceDataSource = RecordingServiceDataSource();

  @override
  Future<List<String>> getAudioFilesList() {
    final response = _recordingServiceDataSource.getAudioFilesList();
    return response;
  }
}
