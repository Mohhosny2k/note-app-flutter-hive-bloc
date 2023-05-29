import 'package:flutter/material.dart';
import 'package:notes_app_flutter/views/widgets/edit_note_view_body.dart';

import '../models/note_model.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: EditNoteViewBody(
        note: note,
      ),
    );
  }
}
