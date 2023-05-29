import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_flutter/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app_flutter/views/widgets/colors_list_view.dart';
import 'package:notes_app_flutter/views/widgets/custom_app_bar.dart';

import '../../constants.dart';
import '../../models/note_model.dart';
import 'custom_text_field.dart';
import 'edit_color_note_list.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: 'Edit Notes',
            icon: Icons.check,
            onPressed: () {
              // if (title != null) {
              //   widget.note.title = title!;
              // }
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = content ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<ReadNotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextField(
            hintText: widget.note.title,
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            hintText: widget.note.subTitle,
            maxLines: 5,
            onChanged: (value) {
              content = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          //  const ColorsListView(),
          EditNoteColorList(
            note: widget.note,
          ),
        ],
      ),
    );
  }
}

