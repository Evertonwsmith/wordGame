import 'package:flutter/material.dart';
import 'package:uxexplore/sty.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
        backgroundColor: bgColor,
      ),
      body: Center(
        child: Text("Settings",
        style: TextStyle(
          color: Colors.white,
          fontSize: 50,
        )),
      ),
    );
  }
}
