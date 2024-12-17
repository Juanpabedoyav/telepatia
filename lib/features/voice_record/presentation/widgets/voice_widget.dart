import 'package:flutter/material.dart';

class VoiceWidget extends StatefulWidget {
  const VoiceWidget({super.key});

  @override
  State<VoiceWidget> createState() => _VoiceWidgetState();
}

class _VoiceWidgetState extends State<VoiceWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {},
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(105, 201, 243, 33),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.mic),
            SizedBox(width: 10),
            Text('Record message'),
          ],
        ),
      ),
    );
  }
}
