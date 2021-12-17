import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/betterbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late String _email;
  late String _password;

  bool _isasync = false;

  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _isasync,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'brand_image',
                  child: Image(
                    width: 250.0,
                    height: 200.0,
                    image: NetworkImage(
                        'https://raw.githubusercontent.com/londonappbrewery/flash-chat-flutter/master/images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Center(
                    child: Text(
                  'Create an account',
                  style: TextStyle(fontSize: 25.0),
                )),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  _email = value;
                },
                decoration:
                    kDecorateInput.copyWith(hintText: 'Enter your Email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  _password = value;
                },
                decoration:
                    kDecorateInput.copyWith(hintText: 'Enter your Password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              BetterMaterialButton(
                  buttonText: 'Register',
                  onTap: () async {
                    setState(() {
                      _isasync = true;
                    });
                    try {
                      UserCredential createUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: _email, password: _password);

                      if (createUser != null) {
                        Navigator.pushNamed(context, '/chat');
                      }
                    } catch (e) {
                      setState(() {
                        _isasync = false;
                      });
                      print(e);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
