import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app_flutter/constants.dart';
import 'package:notes_app_flutter/models/note_model.dart';

import 'add_note_state.dart';
// import 'package:meta/meta.dart';

// part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  // bool isLoading = false;
  Color? color= const  Color(0xffAC3931);
  addNote(NoteModel note) async {
    // isLoading = true;
    note.color = color!.value;
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      // isLoading = false;

      await notesBox.add(note);
      emit(AddNoteSucess());
    } catch (e) {
      // isLoading = false;

      emit(AddNoteFailed(e.toString()));
    }
  }

  // add<T>(T name) {
  //   return name;
  // }
}
