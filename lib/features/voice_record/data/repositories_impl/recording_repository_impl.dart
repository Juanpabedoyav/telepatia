import 'package:firebase_storage/firebase_storage.dart';
import 'package:telepatia/features/voice_record/domain/repositories/recording_repository.dart';

class RecordingRepositoryImpl implements RecordingRepository {
  @override
  Future<Map<String, dynamic>> getRecording() {
    return Future.value({});
  }

  @override
  Future<Map<String, dynamic>> saveRecording(Map<String, dynamic> recording) {
    return Future.value({});
  }

  @override
  Future<ListResult> listAllRecording(Reference storageRef) {
    final list = storageRef.listAll();
    return list;
  }
}
