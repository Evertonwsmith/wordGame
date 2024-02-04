
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class cardModel extends StatefulWidget {
  final dynamic content;
  final String subContent;

  cardModel(this.content, this.subContent, {super.key});

  @override
  State<cardModel> createState() => _cardModelState();
}

class _cardModelState extends State<cardModel> {
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
        child: GestureDetector(
            onTap: (){ navigateTo(widget.content);},
            onLongPress: (){showCardName(widget.subContent);},
            // onLongPressUp: hideCardName(),
            child: getIcon(widget.subContent)),
      ),
    );
  }

  getIcon(String subContent) {
    List<Icon> icons = [
      Icon(LineIcons.plusCircle, color: Colors.white, size:50),
      Icon(LineIcons.bell, color: Colors.white, size:50),
      Icon(LineIcons.folderOpen, color: Colors.white, size:50),
      Icon(LineIcons.cogs, color: Colors.white, size:50),
      Icon(LineIcons.userNinja, color: Colors.white, size:50)
    ];
    switch (subContent) {
      case "0":
        return icons[0];
        break;
      case "1":
        return icons[1];
        break;
      case "2":
        return icons[2];
        break;
      case "3":
        return icons[3];
        break;
      case "4":
        return icons[4];
        break;

      default: Icon(LineIcons.asterisk);
    }
  }

  void navigateTo(dynamic content) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => content),
    );  }

  void showCardName(String subContent) {
    List<String> menuItems = ["New Game", "Challenges", "Previous Games", "Settings", "Profile"];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            menuItems[int.parse(subContent)],
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "close",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


}

BoxDecoration cardDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(40)),
  border: Border.all(color: Colors.white, width: 3),
  color: Colors.black,
);
