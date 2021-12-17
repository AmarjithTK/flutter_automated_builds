import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

// bang operator and null aware operator

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  var loggedUser;

  late String messageText;

  void getUserData() {
    if (_auth.currentUser != null) {
      loggedUser = _auth.currentUser;
    }
  }

  // void fetchmessageFuture() async {
  //   // await _firestore.collection('messages').doc().get();
  //   //    collection('name').get() gets all the doc
  //   //    collection('name').doc(id).get() get a particular document from collection

  //   final documentsCollected = await _firestore.collection('messages').get();

  //   for (var doc in documentsCollected.docs) {
  //     print(doc['sender']);
  //     print(doc['message']);
  //   }
  // }

  // void fetchmessageStream() async {
  //   // realtime subscriber for data ... firebase pushing changes to app
  //   await for (var snapshot in _firestore.collection('messages').snapshots()) {
  //     for (var document in snapshot.docs) {
  //       print(document['message']);
  //     }
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
    // fetchmessageStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat ${loggedUser.email}'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        //Do something with the user input.
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () async {
                      //Implement send functionality.

                      _firestore.collection('messages').add({
                        "message": messageText,
                        "sender": _auth.currentUser!.email
                        // "sender": (_auth.currentUser != null)
                        //     ? _auth.currentUser!.email
                        //     : 'unknown user'
                      });

                      // fetchmessageFuture();
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('messsages').snapshots(),
                builder: (builder, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    ));
                  }
                  final data = snapshot.data!.docs;

                  List<ListTile> messageTiles = [];

                  for (var message in data) {
                    final messageText = message['message'];
                    final sender = message['sender'];
                    print(sender);

                    final messageTile = ListTile(
                        subtitle:
                            Text(sender, style: TextStyle(fontSize: 10.0)),
                        title: Text(messageText,
                            style: TextStyle(fontSize: 20.0)));

                    messageTiles.add(messageTile);
                  }

                  return Expanded(
                    child: ListView(
                      children: messageTiles,
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
