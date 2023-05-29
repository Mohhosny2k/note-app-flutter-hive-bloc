import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app_flutter/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app_flutter/views/edit_note_view.dart';

import '../../models/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.notes});
  final NoteModel notes;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return  EditNoteView(
            note: notes,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
            color: Color(notes.color), //0xffFFCC80
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                notes.title, // 'Flutter Tips',
                style: const TextStyle(color: Colors.black, fontSize: 26),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                    notes.subTitle, //'Build your career with mohamed hosny',
                    style: TextStyle(
                        color: Colors.black.withOpacity(.5), fontSize: 18)),
              ),
              trailing: IconButton(
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.black,
                  size: 24,
                ),
                onPressed: () {
                  notes.delete();
                  BlocProvider.of<ReadNotesCubit>(context).fetchAllNotes();
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text(
                  notes.date, // 'May21,2022',
                  style: TextStyle(
                      color: Colors.black.withOpacity(.4), fontSize: 16),
                ))
          ],
        ),
      ),
    );
  }
}
