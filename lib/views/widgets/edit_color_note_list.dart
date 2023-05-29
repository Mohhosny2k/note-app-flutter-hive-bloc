import 'package:flutter/material.dart';
import 'package:notes_app_flutter/constants.dart';

import '../../models/note_model.dart';
import 'colors_list_view.dart';

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
//  int currentIndex = 0;
  late int currentIndex;
  @override
  void initState() {
    currentIndex = KColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          itemCount: KColors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                  widget.note.color = KColors[index].value;
                },
                child: ColorItem(
                  isActive: currentIndex == index,
                  color: KColors[index],
                ),
              ),
            );
          }),
    );
    ;
  }
}
