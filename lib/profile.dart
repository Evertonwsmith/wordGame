import 'package:flutter/material.dart';
import 'package:uxexplore/sty.dart';
import 'package:uxexplore/saveLoad.dart';

class profile extends StatefulWidget {
  final String user;

  const profile({Key? key, required this.user}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  String username = '';
  int points = 0;
  int wins = 0;
  int losses = 0;
  bool init = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    if (init) {
      // Load user information
      loadUser(context, widget.user);
      init = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        backgroundColor: bgColor,
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator() // Show loading indicator while waiting
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Username: $username',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Points: $points',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Future<void> loadUser(BuildContext context, String user) async {
    setState(() {
      isLoading = true;
    });

    Map<String, dynamic>? loadedData =
        await saveLoad().generalLoad('users', user, '');

    if (loadedData != null) {
      setState(() {
        username = user;
        points = loadedData['score'] ?? 0;
      });
    }

    setState(() {
      isLoading = false;
    });
  }
}
