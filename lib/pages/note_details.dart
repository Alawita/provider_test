import 'package:flutter/material.dart';
import 'package:test_out/models/note.dart';

class NoteDetails extends StatelessWidget {
  const NoteDetails({super.key, required this.note});
  final Note note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(child: Text(note.body)),
        ],
      ),
    );
  }
}
