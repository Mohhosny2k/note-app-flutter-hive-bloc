import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_flutter/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app_flutter/views/widgets/custom_app_bar.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<ReadNotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children:  [
       const   SizedBox(
            height: 50,
          ),
          CustomAppBar(title: 'Notes', icon: Icons.search,onPressed: () {
            
          },),
          //NoteItem(),
        const  Expanded(child: NotesListNiew()),
        ],
      ),
    );
  }
}
