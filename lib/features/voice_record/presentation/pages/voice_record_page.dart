import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:telepatia/features/voice_record/presentation/controller/voice_controller.dart';

class VoiceRecordPage extends ConsumerStatefulWidget {
  const VoiceRecordPage({super.key});

  @override
  ConsumerState<VoiceRecordPage> createState() => _VoiceRecordPageState();
}

class _VoiceRecordPageState extends ConsumerState<VoiceRecordPage> {
  @override
  void initState() {
    super.initState();
    ref.read(voiceControllerProvider.notifier).getAudioFilesList();
  }

  @override
  Widget build(BuildContext context) {
    final voiceState = ref.watch(voiceControllerProvider);
    final voiceController = ref.read(voiceControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Recording'),
            Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (voiceState.isRecording) {
            await voiceController.stopRecordAudio();
          } else {
            await voiceController.recordAudio();
          }
        },
        child: Icon(voiceState.isRecording ? Icons.stop : Icons.mic),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          if (voiceState.isUploading && voiceState.isRecording == false)
            Container(
              padding: const EdgeInsets.only(top: 20),
              margin: const EdgeInsets.only(top: 20),
              width: 200,
              child: Column(
                children: [
                  const Text('Uploading...'),
                  LinearProgressIndicator(
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.blue),
                    value: voiceState.uploadProgress,
                    backgroundColor: Colors.grey,
                  ),
                ],
              ),
            ),
          if (!voiceState.isUploading && voiceState.isRecording)
            SizedBox(
              width: double.infinity,
              child: Center(
                  child: voiceState.isRecording == true
                      ? const Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Recording ...'),
                              SizedBox(height: 10),
                              CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.blue,
                                ),
                                backgroundColor: Colors.grey,
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        )
                      : const Text('Upload complete!')),
            ),
          if (voiceState.audioFilesList.isNotEmpty) const SizedBox(height: 20),
          if (voiceState.audioFilesList.isNotEmpty)
            const SizedBox(
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'List of Recordings from Storage',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          if (voiceState.audioFilesList.isNotEmpty)
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: voiceState.audioFilesList.length,
                itemBuilder: (context, index) {
                  final audioUrl = voiceState.audioFilesList[index];
                  final isPlaying = voiceState.currentPlayingUrl == audioUrl;

                  return Column(
                    children: [
                      ListTile(
                        leading:
                            Icon(isPlaying ? Icons.stop : Icons.play_arrow),
                        title: Text('Audio $index'),
                        subtitle:
                            Text(isPlaying ? 'Playing...' : 'Tap to play'),
                        onTap: () {
                          ref
                              .read(voiceControllerProvider.notifier)
                              .playAudio(audioUrl);
                        },
                      ),
                      const Divider(
                        color: Color.fromARGB(118, 0, 0, 0),
                      ),
                    ],
                  );
                },
              ),
            ),
          if (voiceState.audioFilesList.isEmpty)
            const Center(child: Text('No audios yet. Start recording!')),
        ],
      ),
    );
  }
}
