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

  final messagecontroller = TextEditingController();

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
        leading: IconButton(
            onPressed: () {
              _auth.signOut();

              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.clear_all),
              onPressed: () async {
                //Implement logout functionality

                await _firestore.collection('message').get().then((value) => {
                      for (final document in value.docs)
                        {document.reference.delete()}
                    });
              }),
        ],
        title: Center(
            child: Text('⚡️ Flutter Flash Chat', textAlign: TextAlign.center)),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('message').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    ));
                  }

                  print(snapshot.data!.docs.length);

                  List<Widget> messageTiles = [];

                  for (var message in snapshot.data!.docs) {
                    final messageText = message['message'];
                    final sendermail = message['sender'];
                    final sender = sendermail.split('@')[0];

                    Widget messageTile;

                    print(sender);
                    if (sendermail == loggedUser!.email) {
                      messageTile = MessageBubbleSend(messageText, sender);
                    } else {
                      messageTile = MessageBubbleReceived(messageText, sender);
                    }
                    messageTiles.add(messageTile);
                  }

                  return Expanded(
                    child: ListView(
                      children: messageTiles,
                    ),
                  );
                }),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messagecontroller,
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
                      messagecontroller.clear();
                      _firestore.collection('message').add({
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
          ],
        ),
      ),
    );
  }
}

class MessageBubbleSend extends StatelessWidget {
  MessageBubbleSend(this.message, this.sender);

  final message;
  final sender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              sender,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w200),
            ),
          ),
          Material(
            elevation: 10.0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Text(
                message,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          )
        ],
      ),
    );
  }
}

class MessageBubbleReceived extends StatelessWidget {
  MessageBubbleReceived(this.message, this.sender);

  final message;
  final sender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              sender,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w200),
            ),
          ),
          Material(
            elevation: 10.0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Text(
                message,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            color: Colors.redAccent,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          )
        ],
      ),
    );
  }
}
