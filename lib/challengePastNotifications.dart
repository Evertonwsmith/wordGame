import 'package:flutter/material.dart';
import 'package:uxexplore/challengeModel.dart';
import 'package:uxexplore/sty.dart';

class challengePastNotifications extends StatefulWidget {
  final List<challengeModel> list;

  const challengePastNotifications({super.key, required this.list});

  @override
  State<challengePastNotifications> createState() => _challengePastNotificationsState();
}

class _challengePastNotificationsState extends State<challengePastNotifications> {
  @override
  Widget build(BuildContext context) {
    String wl = 'na';

    return Scaffold(
      appBar: AppBar(
        title: Text("Past Games (inactive)"),
        centerTitle: true,
        backgroundColor: bgColor,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: widget.list.length,
        itemBuilder: (context, index) {
          if(widget.list[index].state.contains(widget.list[index].secretWord)){
            wl = 'W';
          }else{
            wl = 'L';
          }
          return Column(
            children: [
              SizedBox(height: 20),
              ListTile(
                tileColor: Color.fromRGBO(225, 225, 225, 0.5),
                title: Text(
                    widget.list[index].challenger +
                        " / WL:" +wl,
                    style: style),
                subtitle: Text(widget.list[index].status+" : "+widget.list[index].date, style: style2),
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
