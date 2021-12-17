import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kHeading = TextStyle(
    fontSize: 30.0,
    color: dark,
    fontWeight: FontWeight.w900,
    letterSpacing: 5.0);

const dark = Color(0xFF1A374D);
const lightdark = Color(0xFF406882);
const light = Color(0xFF6998AB);
const lighter = Color(0xFFB1D0E0);
const accent = Colors.white;

const kDecorateInput = InputDecoration(
  // hintText: hintText,
  hintStyle: TextStyle(color: dark),
  filled: true,
  fillColor: lighter,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
);
