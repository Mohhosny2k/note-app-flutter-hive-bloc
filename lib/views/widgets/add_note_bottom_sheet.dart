import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app_flutter/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app_flutter/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app_flutter/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'add_note_form.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
// bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailed) {
           // print('Failled  ${state.errMessage}');
          }
          if (state is AddNoteSucess) {
            BlocProvider.of<ReadNotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          print('ui rebuild');
          return AbsorbPointer(
            absorbing: state is AddNoteLoading
                ? true
                : false, // بتمنعك تتعمل مع اي حاجه علي الاسكرين
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(child: AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}
// inAsyncCall: state is AddNoteLoading ? true : false,
