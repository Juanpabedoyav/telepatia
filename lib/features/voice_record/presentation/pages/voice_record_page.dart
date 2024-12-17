import 'package:flutter/material.dart';

class VoiceRecordPage extends StatelessWidget {
  const VoiceRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        const Text('List of recordings'),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const Column(children: []);
              },
            )),
        const SizedBox(height: 20),
      ],
    );
  }
}
