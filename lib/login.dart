import 'package:flutter/material.dart';
import 'package:uxexplore/sty.dart';
import 'package:uxexplore/landing.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController teControllerName = new TextEditingController();
  TextEditingController teControllerPass = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              height: 500,
              decoration: loginBoxDecoration,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FittedBox(
                        child: Text(
                          'Generic Word Game With Pals',
                          style: TextStyle(color: Colors.white70, fontSize: 30),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: teControllerName,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(225, 225, 225, 0.4),
                                fontSize: 20),
                            border: InputBorder.none,
                            hintText: 'First Name')),
                    SizedBox(height: 20),
                    TextFormField(
                        controller: teControllerPass,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(225, 225, 225, 0.4),
                                fontSize: 20),
                            border: InputBorder.none,
                            hintText: 'Passcode')),
                    SizedBox(height: 40),
                    TextButton(
                      onPressed: () {
                        if(teControllerName.text.isNotEmpty && teControllerPass.text == "Everton2024"){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => landing(name: teControllerName.text)));
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Invalid Username or Password"),
                          ));
                        }
                      },
                      child: Text('Login', style: buttonTextStyle),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
