import 'package:firebase_storage/firebase_storage.dart';

class RecordingServiceDataSource {
  Stream<ListResult> listAllRecording(Reference storageRef) async* {
    String? pageToken;
    do {
      final listResult = await storageRef.list(ListOptions(
        maxResults: 100,
        pageToken: pageToken,
      ));
      yield listResult;
      pageToken = listResult.nextPageToken;
    } while (pageToken != null);
  }

  Future<Map<String, dynamic>> saveRecording(
      Map<String, dynamic> recording) async {
    return {};
  }
}
