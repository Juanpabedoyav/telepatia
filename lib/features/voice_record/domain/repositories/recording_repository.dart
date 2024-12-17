import 'package:firebase_storage/firebase_storage.dart';

abstract class RecordingRepository {
  Future<ListResult> listAllRecording(Reference storageRef);
  Future<Map<String, dynamic>> getRecording();
  Future<Map<String, dynamic>> saveRecording(Map<String, dynamic> recording);
}
