import 'package:flutter/material.dart';
import 'package:uxexplore/challengeModel.dart';
import 'package:uxexplore/game.dart';
import 'package:uxexplore/sty.dart';

class challengeNotifications extends StatefulWidget {
  final String user;
  final List<challengeModel> list;

  const challengeNotifications(
      {super.key, required this.list, required this.user});

  @override
  State<challengeNotifications> createState() => _challengeNotificationsState();
}

class _challengeNotificationsState extends State<challengeNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        centerTitle: true,
        backgroundColor: bgColor,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: widget.list.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(height: 20),
              GestureDetector(
                onDoubleTap: () {
                  print(widget.list[index].challenger+widget.list[index].id.toString());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => game(
                              gameModel: widget.list[index],
                              docName: widget.list[index].challenger+widget.list[index].id.toString(),
                              user: widget.user,
                            )),
                  );
                },
                child: ListTile(
                  tileColor: Color.fromRGBO(225, 225, 225, 0.5),
                  title: Text(
                      widget.list[index].challenger +
                          " / WL:" +
                          widget.list[index].length.toString(),
                      style: style),
                  subtitle: Text(widget.list[index].date, style: style2),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

TextStyle style = TextStyle(
  color: Colors.white,
  fontSize: 25,
  fontWeight: FontWeight.bold,
);
TextStyle style2 = TextStyle(
  color: Colors.white,
  fontSize: 15,
  fontWeight: FontWeight.bold,
);
