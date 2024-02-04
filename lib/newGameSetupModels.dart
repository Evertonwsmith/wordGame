
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class newGameSetupModels extends StatefulWidget {
  final int subContent;

  newGameSetupModels(this.subContent, {super.key});

  @override
  State<newGameSetupModels> createState() => _cardModelState();
}

class _cardModelState extends State<newGameSetupModels> {
  @override
  Widget build(BuildContext context) {
    // List<String> contentList = widget.content.split(' ');
    // List<String> subContentList = widget.subContent.split(' ');

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: Colors.white, width: 3),
        color: Colors.black,
      ),
      width: MediaQuery.of(context).size.width * 0.18,
      height: MediaQuery.of(context).size.width * 0.18,
      child: Center(
        child:Text(widget.subContent.toString(), style: textStyle)
      ),
    );
  }

  getIcon(String subContent) {

  }


}

BoxDecoration cardDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(40)),
  border: Border.all(color: Colors.white, width: 3),
  color: Colors.black,
);

TextStyle textStyle = TextStyle(

  color: Colors.white,
  fontSize: 45,
  fontWeight: FontWeight.bold);



TextStyle textStyleError = TextStyle(

    color: Colors.red,
    fontSize: 45,
    fontWeight: FontWeight.bold);
