import 'package:flutter/material.dart';

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
