import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:telepatia/features/voice_record/presentation/controller/voice_controller.dart';

class VoiceWidget extends ConsumerWidget {
  const VoiceWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            if (voiceState.filePath != null)
              ElevatedButton(
                onPressed: () async {
                  if (voiceState.isPlaying) {
                    voiceController.stopAudio();
                  } else {
                    await voiceController.playAudio(voiceState.filePath!);
                  }
                },
                child: Text(voiceState.isPlaying ? 'Stop' : 'Play'),
              ),
            if (voiceState.filePath == null) const Text('No recording'),
          ],
        ),
      ),
    );
  }
}
