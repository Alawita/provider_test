import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:test_out/models/note.dart';
import 'package:test_out/provider/provider_note.dart';
import 'package:test_out/widgets/list_tile_note.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _titleEditController = TextEditingController();

  final TextEditingController _bodyEditController = TextEditingController();

  /* List<Note> notes = [];

  void addNotes(String title, String body) {
    var note = Note(
        title: title,
        body: body,
        id: notes.isNotEmpty ? notes[notes.length - 1].id + 1 : 1);

    notes.insert(0, note);

    setState(() {});
  } */

  @override
  void dispose() {
    _titleEditController.dispose();
    _bodyEditController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Notes"),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  elevation: 10,
                  child: ListTile(
                    leading: Icon(Icons.note),
                    trailing: IconButton(
                        onPressed: () {
                          final noteProvider = context.read<NoteProvider>();
                          noteProvider.addNotes(_titleEditController.text,
                              _bodyEditController.text);

                          _titleEditController.text = "";
                          _bodyEditController.text = "";
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.black,
                        )),
                    title: Column(children: [
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Title", border: InputBorder.none),
                        controller: _titleEditController,
                      ),
                      TextField(
                        maxLines: null,
                        decoration: InputDecoration(
                            hintText: "Body", border: InputBorder.none),
                        controller: _bodyEditController,
                      )
                    ]),
                  )),
            ),
            Consumer<NoteProvider>(builder: (context, noteProvider, child) {
              return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        context.push("/note", extra: noteProvider.notes[index]);
                      },
                      child: noteTile(note: noteProvider.notes[index]));
                },
                itemCount: noteProvider.notes.length,
              );
            })
            //listview builder
          ],
        ),
      ),
    );
  }
}
