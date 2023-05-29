import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app_flutter/models/note_model.dart';

import '../../constants.dart';
part 'read_notes_state.dart';

class ReadNotesCubit extends Cubit<ReadNotesState> {
  ReadNotesCubit() : super(ReadNotesInitial());
List<NoteModel>? notes;
  fetchAllNotes() {
    //emit(ReadNotesLoading());
    // try {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    
    notes = notesBox.values.toList();
    // iterable collcation of note model
    // await notesBox.add(note);
   // emit(ReadNotesSuccess(notes!));
    // } catch (e) {
    //   emit(ReadNotesFailed(e.toString()));
    // }
 emit(ReadNotesSuccess());

  }
}
