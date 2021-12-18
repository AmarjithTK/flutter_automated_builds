import 'package:flutter/material.dart';

class CheckTile extends StatefulWidget {
  CheckTile(this.leading);
  final leading;
  @override
  _CheckTileState createState() => _CheckTileState();
}

class _CheckTileState extends State<CheckTile> {
  bool _checked = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      //   checkColor: Colors.black,
      //   activeColor: Colors.black,
      //   value: _checked,
      //   onChanged: (val) {
      //     setState(() {
      //       _checked = val!;
      //     });
      //   },
      title: Text(
        widget.leading,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.0,
            color: Colors.black,
            decoration:
                _checked ? TextDecoration.lineThrough : TextDecoration.none),
      ),

      trailing: Checkbox(
        checkColor: Colors.black,
        fillColor: MaterialStateProperty.all(Colors.white),
        value: _checked,
        onChanged: (val) {
          setState(() {
            _checked = val!;
          });
        },
      ),
    );
  }
}
