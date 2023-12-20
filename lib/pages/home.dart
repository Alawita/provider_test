import 'package:flutter/material.dart';
import 'package:state_manage/models/note.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _titleEditController = TextEditingController();

  final TextEditingController _bodyEditController = TextEditingController();

  List<Notes> notes = [];

  void addNotes(String title, String body) {
    var note = Notes(
        title: title,
        body: body,
        id: notes.isNotEmpty ? notes[notes.length - 1].id + 1 : 1);

    notes.insert(0, note);

    setState(() {});
  }

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                elevation: 10,
                child: ListTile(
                  leading: Icon(Icons.note),
                  trailing: IconButton(
                      onPressed: () {
                        addNotes(_titleEditController.text,
                            _bodyEditController.text);
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
                      decoration: InputDecoration(
                          hintText: "Body", border: InputBorder.none),
                      controller: _bodyEditController,
                    )
                  ]),
                )),
          ),
          ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(notes[index].title),
                subtitle: Text(notes[index].body),
              );
            },
            itemCount: notes.length,
          )
          //listview builder
        ],
      ),
    );
  }
}
