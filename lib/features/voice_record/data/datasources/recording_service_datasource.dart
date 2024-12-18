import 'package:firebase_storage/firebase_storage.dart';

class RecordingServiceDataSource {
  final _storage = FirebaseStorage.instance;
  Future<List<String>> getAudioFilesList() async {
    final storageRef = _storage.ref().child('voice_notes');
    try {
      final result = await storageRef.listAll();

      final List<String> audioUrls =
          await Future.wait(result.items.map((file) async {
        return await file.getDownloadURL();
      }));
      return audioUrls;
    } catch (e) {
      return [];
    }
  }
}
