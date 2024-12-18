import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:telepatia/features/voice_record/presentation/controller/voice_controller.dart';

class VoiceWidget extends ConsumerStatefulWidget {
  const VoiceWidget({super.key});

  @override
  ConsumerState<VoiceWidget> createState() => _VoiceWidgetState();
}

class _VoiceWidgetState extends ConsumerState<VoiceWidget> {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (voiceState.isUploading && voiceState.isRecording == false)
              SizedBox(
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
            if (!voiceState.isUploading && voiceState.uploadProgress > 0.0)
              const Text('Upload complete!'),
            if (voiceState.filePath != null)
              ElevatedButton(
                onPressed: () async {
                  if (voiceState.isPlaying) {
                    voiceController.stopAudio();
                  } else {
                    await voiceController.playAudio(voiceState.filePath!);
                  }
                },
                child: Text(voiceState.isPlaying && voiceState.filePath == null
                    ? 'Stop'
                    : 'Play'),
              ),
            if (voiceState.filePath == null) const Text('No recording'),
            if (voiceState.downloadUrl != null)
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(voiceControllerProvider.notifier)
                      .playAudio(voiceState.downloadUrl!);
                },
                child: const Text('Play downloaded'),
              ),
            if (voiceState.audioFilesList.isNotEmpty)
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: ListView.builder(
                  itemCount: voiceState.audioFilesList.length,
                  itemBuilder: (context, index) {
                    final audioUrl = voiceState.audioFilesList[index];

                    return ListTile(
                      title: Text('Audio $index'),
                      subtitle: Text(audioUrl),
                      onTap: () async {
                        await ref
                            .watch(voiceControllerProvider.notifier)
                            .playAudio(audioUrl);
                      },
                    );
                  },
                ),
              ),
            if (voiceState.audioFilesList.isEmpty)
              const Center(child: Text('No audio files')),
          ],
        ),
      ),
    );
  }
}
