import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mynotesapp/style/app_style.dart';

class NoteReaderScreen extends StatefulWidget {
  NoteReaderScreen(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;
  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  TextEditingController _editedTitleController = TextEditingController();
  TextEditingController _editedContentController = TextEditingController();

  //updating the edited note
  void _updateNote() async {
    await FirebaseFirestore.instance
        .collection("Notes")
        .doc(widget.doc.id)
        .update({
      "note_title": _editedTitleController.text,
      "note_content": _editedContentController.text,
    });
  }

  //function to delete the note
  void _deleteNote() async {
    await FirebaseFirestore.instance
        .collection("Notes")
        .doc(widget.doc.id)
        .delete();
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _editedTitleController.text = widget.doc["note_title"];
    _editedContentController.text = widget.doc["note_content"];
  }

  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.doc["note_title"],
                  style: AppStyle.mainTitle,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Edit note"),
                                content: Column(
                                  children: [
                                    TextField(
                                      controller: _editedTitleController,
                                      decoration:
                                          InputDecoration(labelText: 'Title'),
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Container(
                                      height: 200,
                                      child: TextField(
                                        controller: _editedContentController,
                                        maxLines: null,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                            labelText: 'Content'),
                                      ),
                                    )
                                  ],
                                ),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        _updateNote();
                                        Navigator.pop(context);
                                      },
                                      child: Text("Save"))
                                ],
                              );
                            });
                      },
                    ),
                      IconButton(onPressed: _deleteNote, icon: Icon(Icons.delete))
                  ],
                )
              ],
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              DateFormat('yyyy-MM-dd').format(DateTime.parse(widget.doc["creation_date"])),
              style: AppStyle.dateTitle,
            ),
            SizedBox(
              height: 28.0,
            ),
            Text(
              widget.doc["note_content"],
              style: AppStyle.mainContent,
              overflow: TextOverflow.visible,
            )
          ],
        ),
      ),
    );
  }
}
