import 'package:flutter/material.dart';
import 'package:todey/widgets/checktileview.dart';
import '../constants.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Material(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu, size: 30.0),
                      color: scaffoldColor,
                    ),
                  ),
                ),
                SizedBox(height: 25.0),
                Text(
                  'Todey',
                  style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w900,
                      color: colorW),
                ),
                Text(
                  '15 Tasks',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 25.0),
              ],
            ),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: CheckTileView(),
          ))
        ],
      ),
    );
  }
}

// class CheckBoxTile extends StatelessWidget {
//   const CheckBoxTile({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CheckboxListTile(
//       value: false,
//       onChanged: (val) {},
//       title: Text('This is the data'),
//       // trailing: Icon(Icons.check_box_outline_blank),
//     );
//   }
// }

// this is a comment


// class TodoScreen extends StatefulWidget {
//   const TodoScreen({ Key? key }) : super(key: key);

//   @override
//   _TodoScreenState createState() => _TodoScreenState();
// }

// class _TodoScreenState extends State<TodoScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }