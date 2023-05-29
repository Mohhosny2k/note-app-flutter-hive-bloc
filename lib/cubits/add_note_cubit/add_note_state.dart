// part of 'add_note_cubit.dart';

// @immutable
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSucess extends AddNoteState {}

class AddNoteFailed extends AddNoteState {
  final String? errMessage;

  AddNoteFailed(this.errMessage);
}
