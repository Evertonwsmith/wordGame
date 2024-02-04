import 'package:flutter/material.dart';
import 'package:uxexplore/challengeModel.dart';
import 'package:uxexplore/landing.dart';
import 'package:uxexplore/saveLoad.dart';
import 'package:uxexplore/sty.dart';

class game extends StatefulWidget {
  final challengeModel gameModel;
  final String docName;
  final String user;

  game(
      {Key? key,
      required this.gameModel,
      required this.docName,
      required this.user})
      : super(key: key);

  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> {
  late List<TextEditingController> textControllers;
  late List<String> states;
  late int currentGuessCount;

  @override
  void initState() {
    super.initState();
    textControllers = List.generate(
      widget.gameModel.length,
      (index) => TextEditingController(),
    );
    states = widget.gameModel.state.split('%');
    states.removeAt(0);
  }

  void resetState(String temp) {
    setState(() {
      states = temp.split('%');
      states.removeAt(0);
    });
  }

  @override
  void dispose() {
    for (var controller in textControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  bool gameDone = false;
  bool win = false;

  @override
  Widget build(BuildContext context) {
    currentGuessCount = 0;
    List<String> tet = widget.gameModel.state.split('%');
    if (tet[0] == 'inactive' || currentGuessCount >= widget.gameModel.length) {
      if (tet.contains(widget.gameModel.secretWord)) {
        win = true;
      }
      gameDone = true;
    }
    print('Current Truth: ' +
        (currentGuessCount >= widget.gameModel.length).toString());
    print('Current Truth2: ' + gameDone.toString());

    return gameDone
        ? win
            ? Scaffold(
                appBar: AppBar(
                  title: Text(widget.docName),
                  centerTitle: true,
                  backgroundColor: bgColor,
                  leading: IconButton(
                    icon: Icon(Icons.home_filled),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => landing(name: widget.user)),
                      );
                    },
                  ),
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'You win!',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Word was'
                        ': ${widget.gameModel.secretWord}',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Challenger: ${widget.gameModel.challenger}',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  title: Text(widget.docName),
                  centerTitle: true,
                  backgroundColor: bgColor,
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'You lost',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Word was'
                        ': ${widget.gameModel.secretWord}',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Your Name: ${widget.user}',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
        : Scaffold(
            appBar: AppBar(
              title: Text('${widget.gameModel.challenger}\'s Challenge'),
              centerTitle: true,
              backgroundColor: bgColor,
            ),
            body: combineThings(context, states, textControllers),
          );
  }

  List<Widget> enteredGuesses(
      BuildContext context, List<String> states, int entered) {
    bool gr = false;
    bool ye = false;
    List<Widget> list = [];
    for (String state in states) {
      if (!state.contains('/')) {
        currentGuessCount++;
        for (int x = 0; x < widget.gameModel.length; x++) {
          gr = false;
          ye = false;
          if (widget.gameModel.secretWord.contains(state[x])) {
            ye = true;
          }
          if (state[x] == widget.gameModel.secretWord.substring(x, x + 1)) {
            gr = true;
          }
          // print('enteredGuess State: ' + state);
          list.add(Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Colors.white, width: 3),
              color: gr
                  ? Colors.green
                  : ye
                      ? Colors.yellow
                      : Colors.black,
            ),
            width: MediaQuery.of(context).size.width * 0.18,
            height: MediaQuery.of(context).size.width * 0.18,
            child: Center(
                child: Text(state[x],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ))),
          ));
        }
      }
    }
    return list;
  }

  List<Widget> currentGuess(BuildContext context, List<String> states, int entered,
      List<TextEditingController> textControllers) {
    List<Widget> list = [];
    bool found = false;

    for (String state in states) {
      if (!found) {
        if (state.contains('/')) {
          found = true;
          print('enteredGuess State: ' + state);
          for (int x = 0; x < widget.gameModel.length; x++) {
            print('start: ' + x.toString());
            list.add(Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.white, width: 3),
                color: Colors.black,
              ),
              width: MediaQuery.of(context).size.width * 0.18,
              height: MediaQuery.of(context).size.width * 0.18,
              child: Center(
                  child: TextFormField(
                onTap: () {
                  print(textControllers[x].text);
                },
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                maxLength: 1,
                controller: textControllers[x],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              )),
            ));
          }
        }
      }
    }
    return list;
  }

  Widget combineThings(BuildContext context, List<String> states,
      List<TextEditingController> textControllers) {
    print("This print: " + states.toString());
    int entered = states.length - 1;
    List<Widget> list = [];
    List<Widget> one = enteredGuesses(context, states, entered);
    List<Widget> two = currentGuess(context, states, entered, textControllers);
    list.add(SizedBox(
      height: 40,
    ));
    if (one.isNotEmpty) {
      int numberOfRows = one.length ~/ widget.gameModel.length;
      for (int i = 0; i < numberOfRows; i++) {
        list.add(Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: one.sublist(i * widget.gameModel.length,
                (i + 1) * widget.gameModel.length)));
      }
    }
      list.add(Row(children: two,mainAxisAlignment: MainAxisAlignment.spaceEvenly));
      list.add(SizedBox(
        height: 40,
      ));
      list.add(GestureDetector(
        onTap: () => enterGuess(textControllers, states),
        // Wrap the function call in a lambda
        child: Text('Enter',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ));

    return Column(children: list);
  }

  enterGuess(List<TextEditingController> textControllers, List<String> states) {
    currentGuessCount++;
    print('Current Guess: ' + currentGuessCount.toString());
    print('Length: ' + widget.gameModel.length.toString());
    if (currentGuessCount >= widget.gameModel.length) {
      gameDone = true;
    }
    bool isValid = true;
    List<String> newStates = List.from(states);
    print('ENTER HIT');
    String val = '';

    for (int i = 0; i < textControllers.length; i++) {
      String enteredLetter = textControllers[i].text;
      print('A');
      if (enteredLetter.length != 1 ||
          !RegExp(r'[a-zA-Z]').hasMatch(enteredLetter)) {
        // Validation failed, show an error or handle accordingly
        isValid = false;
        print('B');
        break;
      } else {
        val = val += enteredLetter;
        // Update the state with the entered letter
      }
    }

    // Update the state only if validation passed
    if (isValid) {
      setState(() {
        for (int i = 0; i < newStates.length; i++) {
          if (newStates[i].contains('/')) {
            newStates[i] = val;
            break; // Break after updating the first occurrence
          }
        }

        challengeModel cM = widget.gameModel;
        List<String> ogStates = widget.gameModel.state.split('%');
        String temp = ogStates[0];
        if (gameDone || win) {
          temp = 'inactive';
        }
        for (String state in newStates) {
          if (state == widget.gameModel.secretWord) {
            gameDone = true;
            win = true;
            addPoints(widget.user, 100);
          }
          temp = temp + '%' + state;
        }
        cM.state = temp;

        Map<String, dynamic> addThis = {
          "word": cM.secretWord,
          "length": cM.length,
          "guesses": cM.guesses,
          "friends": cM.challenged,
          "user": widget.user,
          "state": cM.state,
          "date": cM.date,
          "id": cM.id,
        };

        saveLoad().generalSave('games', widget.docName, addThis);

        resetState(temp);
      });
    } else {
      print('VALIDATION FAILED');
      //TODO: add popup to say to enter all letters
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Validation Failed',
                  style: TextStyle(color: Colors.white)),
              content: Text('Please enter all letters',
                  style: TextStyle(color: Colors.white)),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK', style: TextStyle(color: Colors.white)),
                ),
              ],
            );
          });
    }
  }
}

Future<void> addPoints(String user, int i) async {
  Map<String, dynamic>? currentUser =
      await saveLoad().generalLoad('users', user, '');
  int preScore = currentUser?.update('score', (value) => value + i);
  Map<String, dynamic> addThis = {
    "score": preScore,
  };
  saveLoad().generalSave('users', user, addThis);
}
