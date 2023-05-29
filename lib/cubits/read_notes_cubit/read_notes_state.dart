part of 'read_notes_cubit.dart';

@immutable
abstract class ReadNotesState {}

class ReadNotesInitial extends ReadNotesState {}

//class ReadNotesLoading extends ReadNotesState {}

// class ReadNotesSuccess extends ReadNotesState {
//   //علشان كلهم بيتعرضوا في مكان واحد مش كذا مكان منفصل
//   final List<NoteModel> notes;

//   ReadNotesSuccess(this.notes);
// }

// class ReadNotesFailed extends ReadNotesState {
//   final String eerMessage;
//   ReadNotesFailed(this.eerMessage);
//}
class ReadNotesSuccess extends ReadNotesState {}
