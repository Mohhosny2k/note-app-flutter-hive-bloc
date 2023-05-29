import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app_flutter/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app_flutter/models/note_model.dart';
import 'package:notes_app_flutter/views/widgets/custom-button.dart';
import 'package:notes_app_flutter/views/widgets/custom_text_field.dart';

import '../../cubits/add_note_cubit/add_note_state.dart';
import 'colors_list_view.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> fromKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  // لو هنشاء متغير مش فاينل يفضل يبقي جوه ال استفسل ويديجت لان هي مش بتحفاظ علي الاستيت
  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        //padding:const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            hintText: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            hintText: 'Content',
            maxLines: 5,
            onSaved: (value) {
              subTitle = value;
            },
          ),
           const SizedBox(
            height: 32,
          ),
          const  ColorsListView(),
          const SizedBox(
            height: 32,
          ),
        
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (fromKey.currentState!.validate()) {
                    fromKey.currentState!.save();
                    var currentDate = DateTime.now();
                    var formattedCurrentDate =
                        DateFormat('dd-MM-yyyy').format(currentDate);
                    // DateFormat.yMd().format(currentDate);
                    var noteModel = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: formattedCurrentDate.toString(),
                        color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}


