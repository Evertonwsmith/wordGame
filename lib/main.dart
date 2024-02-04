import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uxexplore/challengeModel.dart';
import 'package:uxexplore/firebase_options.dart';
import 'package:uxexplore/game.dart';
import 'package:uxexplore/landing.dart';
import 'package:uxexplore/login.dart';
import 'package:uxexplore/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(background: Colors.black),
        ),
        // home: login());
        home: landing(name: 'Everton'));
        // home: game(gameModel: empt, docName: 'Everton379', user: 'Everton'));
  }
}

challengeModel empt = challengeModel(
  length: 4,
  guesses: 5,
  status: 'active',
  date: '2024-01-01,',
  state: 'inactive%fart%dull%daft%////%////',
  challenger: 'Everton',
  challenged: ['Everton'],
  secretWord: 'daft', id: -1,
);
