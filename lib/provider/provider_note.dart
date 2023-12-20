import 'package:flutter/material.dart';
import 'package:test_out/models/note.dart';

class NoteProvider extends ChangeNotifier {
  List<Note> notes = [];

  void addNotes(String title, String body) {
    var note = Note(
        title: title,
        body: body,
        id: notes.isNotEmpty ? notes[notes.length - 1].id + 1 : 1);

    notes.insert(0, note);
    notifyListeners();
  }
}
