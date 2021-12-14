import 'package:flutter/material.dart';
import '../widgets/betterbutton.dart';
// import 'package:linuxclock/screens/login_screen.dart';
// import 'package:linuxclock/screens/registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = '/'; // very important concept here bro!!

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  // late AnimationController controller;
  // late Animation animation;
  // late Animation colorTween;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   controller = AnimationController(
  //     duration: Duration(
  //       seconds: 2,
  //     ),

  //     vsync: this,
  //     // upperBound: 1,
  //   );

  //   controller.forward(from: 0.3);

  //   animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
  //   animation.addStatusListener((status) {
  //     print(status);

  //     if (status == AnimationStatus.completed) {
  //       controller.reverse(from: 1);
  //     } else if (status == AnimationStatus.dismissed) {
  //       controller.forward(from: 0.5);
  //     }
  //   });

  //   // Tweens animation ( oscillating bw two values)
  //   // color tween

  //   colorTween =
  //       ColorTween(begin: Colors.green, end: Colors.blue).animate(controller);

  //   controller.addListener(() {
  //     setState(() {});
  //   });
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text('Flash Chat Firebase'),
        ),
      ),
      // backgroundColor: Colors.red.withOpacity(controller.value),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Center(
                  child: Hero(
                    tag: 'brand_image',
                    child: Image(
                      width: 150,
                      image: NetworkImage(
                          'https://raw.githubusercontent.com/londonappbrewery/flash-chat-flutter/master/images/logo.png'),
                    ),
                  ),
                ),
                Text('flashchat',
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5.0))
              ],
            ),
            Center(
                child: Text('controller.value.toStringAsFixed(2)',
                    style: TextStyle(fontSize: 50.0))),
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
