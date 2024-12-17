abstract class RecordingRepository {
  Future<Map<String, dynamic>> getRecording();
  Future<Map<String, dynamic>> saveRecording(Map<String, dynamic> recording);
}
