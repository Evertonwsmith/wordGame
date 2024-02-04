import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:uxexplore/cardModel.dart';
import 'package:uxexplore/challengeModel.dart';
import 'package:uxexplore/saveLoad.dart';
import 'package:uxexplore/sty.dart';
import 'package:uxexplore/newChallenge.dart';
import 'package:uxexplore/challengePastNotifications.dart';
import 'package:uxexplore/challengeNotifications.dart';
import 'package:uxexplore/profile.dart';
import 'package:uxexplore/settings.dart';
import 'package:uxexplore/friends.dart';

class landing extends StatefulWidget {
  final String name;

  const landing({super.key, required this.name});

  @override
  State<landing> createState() => _landingState();
}

class _landingState extends State<landing> {
  bool init = true;
  bool notif = false;
  List<challengeModel> result = [];
  List<challengeModel> result2 = [];

  @override
  Widget build(BuildContext context) {
      Future<List<challengeModel>> usersChallenges = load(widget.name);
      usersChallenges.then((challenges) {

        setState(() {
          result = challenges;
        });
      });

      Future<List<challengeModel>> usersChallenges2 = loadOld(widget.name);
      usersChallenges2.then((challenges) {
        setState(() {
          result2 = challenges;
        });
      });


    return Scaffold(
        appBar: AppBar(
          title: Text(this.widget.name),
          centerTitle: true,
          backgroundColor: bgColor,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Container(
              child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                    cardModel(newChallenge(user: widget.name), "0"),
                    Stack(children: [
                      cardModel(challengeNotifications(list: result, user: widget.name), "1"),
                      Container(
                        width: notif ? 15 : 0,
                        height: notif ? 15 : 0,
                        child: Icon(
                          LineIcons.bell,
                          size: 15,
                          color: notif ? Colors.red : Colors.white,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                      Icon(LineIcons.exclamationCircle, color: Colors.red),
                    ]),
                    cardModel(challengePastNotifications(list: result2), "2"),
                    cardModel(settings(), "3"),
                    cardModel(profile(user: widget.name), "4"),
                  ])),
            ),
          ],
        ));
  }
}

Future<List<challengeModel>> load(String id) async {
  List<challengeModel> data = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  QuerySnapshot ref = await firestore.collection('games').get();
  for (QueryDocumentSnapshot doc in ref.docs) {
    if (doc.get('user') == id) {
      List<String> states = doc['state'].split('%');
      if (states[0] == 'active') {
        data.add(challengeModel(
            length: doc.get('length'),
            guesses: doc.get('guesses'),
            date: doc.get('date'),
            state: doc.get('state'),
            challenger: doc.get('user'),
            challenged: doc.get('friends'),
            secretWord: doc.get('word'),
            status: states[0], id: doc.get('id')));
      }
    }
  }
  return data;
}
Future<List<challengeModel>> loadOld(String id) async {
  List<challengeModel> data = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  QuerySnapshot ref = await firestore.collection('games').get();
  for (QueryDocumentSnapshot doc in ref.docs) {
    if (doc.get('user') == id) {
      List<String> states = doc['state'].split('%');
      if (states[0] != 'active') {
        data.add(challengeModel(
            length: doc.get('length'),
            guesses: doc.get('guesses'),
            date: doc.get('date'),
            state: doc.get('state'),
            challenger: doc.get('user'),
            challenged: doc.get('friends'),
            secretWord: doc.get('word'),
            status: states[0], id: doc.get('id')));
      }
    }
  }
  return data;
}