import 'package:flutter/material.dart';
import 'package:linuxclock/screens/login_screen.dart';
import 'package:linuxclock/screens/registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = '/'; // very important concept here bro!!

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text('Flash Chat Firebase'),
        ),
      ),
      // backgroundColor: Colors.green,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Image(
                width: 200.0,
                height: 200.0,
                image: NetworkImage(
                    'https://raw.githubusercontent.com/londonappbrewery/flash-chat-flutter/master/images/logo.png'),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            BetterMaterialButton(
              buttonText: 'Login',
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            BetterMaterialButton(
              buttonText: 'Sign Up',
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BetterMaterialButton extends StatelessWidget {
  BetterMaterialButton({required this.buttonText, required this.onTap});
  final String buttonText;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: MaterialButton(
        color: Colors.lightBlue,
        padding: EdgeInsets.symmetric(vertical: 15.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: onTap,
        child: Text(buttonText),
      ),
    );
  }
}
