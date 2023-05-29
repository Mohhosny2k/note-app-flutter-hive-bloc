import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_flutter/cubits/read_notes_cubit/read_notes_cubit.dart';
import '../../models/note_model.dart';
import 'custom_note_item.dart';
class NotesListNiew extends StatelessWidget {
  const NotesListNiew({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNotesCubit, ReadNotesState>(
      builder: (context, state) {
       // List<NoteModel>notes=BlocProvider.of<ReadNotesCubit>(context).notes!;
        List<NoteModel>notes=BlocProvider.of<ReadNotesCubit>(context).notes ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
          itemCount: notes.length,//state is ReadNotesSuccess?state.notes.length:0,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return  Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child:  NoteItem(
                  notes: notes[index],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
