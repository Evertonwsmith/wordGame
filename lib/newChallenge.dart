import 'dart:math';

import 'package:dictionaryx/dictionary_msa_json_flutter.dart';
import 'package:flutter/material.dart';
import 'package:uxexplore/friends.dart';
import 'package:uxexplore/landing.dart';
import 'package:uxexplore/newGameSetupModels.dart';
import 'package:uxexplore/saveLoad.dart';
import 'package:uxexplore/sty.dart';

class newChallenge extends StatefulWidget {
  final String user;

  const newChallenge({super.key, required this.user});

  @override
  State<newChallenge> createState() => _newChallengeState();
}

class _newChallengeState extends State<newChallenge> {
  int wordLength = 0;
  int id = 0;
  String word = "";
  int guesses = 0;
  int currentStep = 0;
  TextEditingController textController123 = new TextEditingController();
  bool error = false;
  List<String> challenged = [];
  var dMSAJson = DictionaryMSAFlutter();

  @override
  Widget build(BuildContext context) {
    String nulluser = '';
    id = Random().nextInt(100);
    if (widget.user == null) {
      nulluser = "ER2 Null Found";
    }
    print("Step: " +
        currentStep.toString() +
        " wordLength: " +
        wordLength.toString() +
        " guesses: " +
        guesses.toString());
    return Scaffold(
        appBar: AppBar(
          title: Text('New Challenge'),
          centerTitle: true,
          backgroundColor: bgColor,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(findText(currentStep, wordLength, word, guesses),
                style: TextStyle(color: Colors.white)),
            SizedBox(height: 50),
            Container(
              child: Center(
                child: Wrap(spacing: 10, children: findChildren(currentStep)),
              ),
            ),
          ],
        ));
  }

  List<Widget> findChildren(int step) {
    switch (step) {
      case 0:
        return [
          GestureDetector(
              onTap: () {
                setState(() {
                  currentStep++;
                  wordLength = 3;
                });
              },
              child: newGameSetupModels(3)),
          GestureDetector(
              onTap: () {
                setState(() {
                  currentStep++;
                  wordLength = 4;
                });
              },
              child: newGameSetupModels(4)),
          GestureDetector(
              onTap: () {
                setState(() {
                  currentStep++;
                  wordLength = 5;
                });
              },
              child: newGameSetupModels(5)),
          GestureDetector(
              onTap: () {
                setState(() {
                  currentStep++;
                  wordLength = 6;
                });
              },
              child: newGameSetupModels(6)),
          GestureDetector(
              onTap: () {
                setState(() {
                  currentStep++;
                  wordLength = 7;
                });
              },
              child: newGameSetupModels(7))
        ];
        break;
      case 1:
        return [
          GestureDetector(
              onTap: () {
                setState(() {
                  currentStep++;
                  guesses = wordLength - 1;
                });
              },
              child: newGameSetupModels(wordLength - 1)),
          GestureDetector(
              onTap: () {
                setState(() {
                  currentStep++;
                  guesses = wordLength;
                });
              },
              child: newGameSetupModels(wordLength)),
          GestureDetector(
              onTap: () {
                setState(() {
                  currentStep++;
                  guesses = wordLength + 1;
                });
              },
              child: newGameSetupModels(wordLength + 1)),
          GestureDetector(
              onTap: () {
                setState(() {
                  currentStep++;
                  guesses = wordLength + 2;
                });
              },
              child: newGameSetupModels(wordLength + 2)),
          GestureDetector(
              onTap: () {
                setState(() {
                  currentStep++;
                  guesses = wordLength + 3;
                });
              },
              child: newGameSetupModels(wordLength + 3))
        ];
        break;
      case 2:
        return populateFriends();

        break;
      case 3:
        return getWord();

      default:
        return [];
    }
  }

  List<Widget> populateFriends() {
    List<Widget> result = [];
    for (int i = 0; i < friends.length; i++) {
      result.add(GestureDetector(
        onTap: () {
          setState(() {
            currentStep++;
            challenged.add(friends[i]);
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: Colors.white, width: 3),
            color: Colors.black,
          ),
          width: MediaQuery.of(context).size.width * 0.18,
          height: MediaQuery.of(context).size.width * 0.18,
          child: Center(
              child: FittedBox(child: Text(friends[i], style: textStyle))),
        ),
      ));
    }
    return result;
  }

  String findText(int currentStep, int wordLength, String word, int guesses) {
    switch (currentStep) {
      case 0:
        return "Choose a word length";
        break;
      case 1:
        return "Length = " +
            wordLength.toString() +
            ".   Choose how many guesses";
        break;
      case 2:
        return "Length = " +
            wordLength.toString() +
            ".   Guesses = " +
            guesses.toString() +
            ".   Choose what friends to challenge";
        break;
      case 3:
        return "Length = " +
            wordLength.toString() +
            ".   Guesses = " +
            guesses.toString() +
            ".   Challenging: " +
            challenged.toString();
        break;
      case 4:
      default:
        return "ER1: error";
    }
  }

  List<Widget> getWord() {
    Column item = Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: Colors.white, width: 3),
            color: Colors.black,
          ),
          width: MediaQuery.of(context).size.width * 0.80,
          height: MediaQuery.of(context).size.width * 0.35,
          child: Center(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                    controller: textController123,
                    onChanged: (value) {
                      if (value.length > wordLength ||
                          value.length < wordLength)
                        setState(() {
                          error = true;
                        });
                      else
                        setState(() {
                          error = false;
                        });
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your word",
                      hintStyle: textHint,
                    ),
                    style: error ? textStyleError : textStyle),
              ),
            ],
          )),
        ),
        SizedBox(height: 40),
        OutlinedButton(
          onPressed: trySave(),
          child: Text("Send", style: buttonTextStyle),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            elevation: MaterialStateProperty.all<double>(0),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        )
      ],
    );
    List<Widget> result = [item];
    return result;
  }

  Future<bool> confirmWord(String value) {
    return dMSAJson.hasEntry(value);
  }

  trySave() {
    String gs = "active";
    for (int i = 0; i < guesses; i++) {
      gs += '%';
      for (int j = 0; j < wordLength; j++) {
        gs += '/';
      }
    }
    return () async {
      if (textController123.text.length == wordLength) {
        if (await confirmWord(textController123.text)) {
          setState(() {
            word = textController123.text;
          });
          Map<String, dynamic> addThis = {
            "word": textController123.text,
            "length": wordLength,
            "guesses": guesses,
            "friends": challenged,
            "user": widget.user,
            "state": gs,
            "date": DateTime.now().toString(),
            "id" : id,
          };
          saveLoad().generalSave('games',
              widget.user + id.toString(), addThis);

          print('saved');
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Success!"),
                  content: Text(
                      "You have successfully challenged " +
                          challenged.toString() +
                          "!  The word is " +
                          word,
                      style: TextStyle(color: Colors.white)),
                  actions: <Widget>[
                    TextButton(
                      child: Text("OK"),
                      onPressed: () {
                        widget.user == null
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => landing(name: "")))
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => landing(
                                          name: widget.user,
                                        )));
                      },
                    ),
                  ],
                );
              });
        }
      }
    };
  }
}

class savingObject {
  int id;
  String startuser;
  String state;
  List<String> vuser;

  savingObject(this.id, this.startuser, this.state, this.vuser);
}
