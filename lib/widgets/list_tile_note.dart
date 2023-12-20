import 'package:flutter/material.dart';
import 'package:test_out/models/note.dart';

class noteTile extends StatelessWidget {
  const noteTile({
    super.key,
    required this.note,
  });

  final Note note;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: ListTile(
        title: Text(note.title),
        subtitle: Text(note.body),
      ),
    );
  }
}
