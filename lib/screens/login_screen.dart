import 'package:flutter/material.dart';
import '../widgets/betterbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants.dart';

class LoginScreen extends StatefulWidget {
  // static String id = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;

  FirebaseAuth _auth = FirebaseAuth.instance;

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
            Flexible(
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
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                //Do something with the user input.
                email = value;
              },
              decoration: kDecorateInput.copyWith(hintText: 'Enter your email'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value) {
                //Do something with the user input.
                password = value;
              },
              decoration:
                  kDecorateInput.copyWith(hintText: 'Enter your Password'),
            ),
            SizedBox(
              height: 24.0,
            ),
            BetterMaterialButton(
                buttonText: 'Sign in',
                onTap: () async {
                  try {
                    UserCredential user =
                        await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                    if (user != null) {
                      Navigator.pushNamed(context, '/chat');
                    }
                  } catch (e) {
                    print(e);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
