import 'package:flutter/material.dart';
import 'package:linuxclock/widgets/betterbutton.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  // static String id = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 50.0,
              child: Hero(
                tag: 'logo',
                child: Image(
                  image: NetworkImage(
                      'https://raw.githubusercontent.com/londonappbrewery/flash-chat-flutter/master/images/logo.png'),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Center(
                  child: Text(
                'Sign in into account',
                style: TextStyle(fontSize: 25.0),
              )),
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration:
                  kDecorateInput.copyWith(hintText: 'Enter your Password'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration:
                  kDecorateInput.copyWith(hintText: 'Enter your Password'),
            ),
            SizedBox(
              height: 24.0,
            ),
            BetterMaterialButton(buttonText: 'Register', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
