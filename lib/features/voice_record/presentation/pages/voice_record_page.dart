import 'package:flutter/material.dart';
import 'package:telepatia/features/voice_record/presentation/widgets/voice_widget.dart';

class VoiceRecordPage extends StatelessWidget {
  const VoiceRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        VoiceWidget(),
      ],
    );
  }
}
