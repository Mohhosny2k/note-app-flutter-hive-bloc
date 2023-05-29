import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app_flutter/constants.dart';
import 'package:notes_app_flutter/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app_flutter/models/note_model.dart';
import 'package:notes_app_flutter/simple_bloc_observer.dart';
import 'package:notes_app_flutter/views/notes_view.dart';
import 'package:notes_app_flutter/views/onboarding_screen.dart';
import 'package:notes_app_flutter/views/splash_screen.dart';

import 'cubits/read_notes_cubit/read_notes_cubit.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();//1
  Hive.registerAdapter(NoteModelAdapter());//2
  await Hive.openBox<NoteModel>(kNotesBox);//3
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
       create: (context) => ReadNotesCubit(),
      child: MaterialApp(
        title: 'Flutter Notes',
        theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Poppins'), //ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        routes: {
         'boarding':(context) => onBoardingScreen(),
        },
        home: const SplashScreen(),//NotesView()
      ),
    );
  }
}
