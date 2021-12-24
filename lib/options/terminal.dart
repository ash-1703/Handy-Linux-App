import 'package:LinuxApp/firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

class Terminal extends StatefulWidget {
  @override
  _TerminalState createState() => _TerminalState();
}

class _TerminalState extends State<Terminal> {
  var fsconnect = FirebaseFirestore.instance;
  //DocumentReference userDBRef = FirebaseFirestore.instance.collection('TerminalLogs').doc("TerminalLogs/hello");
  var cmd;
  var webdata;
  var _controller = TextEditingController();
  TextEditingController ipController = new TextEditingController();

  Future<void> addLog(command, output) {
    // Call the user's CollectionReference to add a new user
    return dbRef
        .add({
          'command': command, // John Doe
          'output': output,
          'timestamp': FieldValue.serverTimestamp() // Stokes and Sons
        })
        .then((value) => print("Log Added"))
        .catchError((error) => print("Failed to add Log: $error"));
  }

  web(cmd) async {
    var url = 'http://${ipController.text}/cgi-bin/script.py?x=${cmd}';
    var response = await http.get(url);
    setState(() {
      webdata = response.body;
    });
    //fsconnect.collection("linuxcmdoutput").add({'$cmd': '$webdata'});

    print(dbRef.id);
    
    addLog(cmd, webdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Terminal',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        leading: Icon(
          FontAwesomeIcons.linux,
          color: Colors.black,
          size: 50,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: ipController,
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide:
                        BorderSide(color: Colors.orangeAccent, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide:
                        BorderSide(color: Colors.orangeAccent, width: 1),
                  ),
                  hintText: 'Enter the IP of remote LinuxOS',
                  prefixIcon: Icon(
                    FontAwesomeIcons.networkWired,
                    color: Colors.deepOrange,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              color: Colors.black,
              padding: EdgeInsets.all(10),
              child: Text(
                'Remote Linux Access',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: _controller,
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(
                      color: Colors.orangeAccent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(
                      color: Colors.orangeAccent,
                    ),
                  ),
                  hintText: 'Enter the linux command',
                  prefixIcon: Icon(
                    FontAwesomeIcons.keyboard,
                    color: Colors.deepOrange,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                onChanged: (value) {
                  cmd = value;
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: _controller.clear,
                  child: Padding(
                    padding: const EdgeInsets.all(13),
                    child: Text(
                      "Clear",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  color: Colors.orange.shade100,
                ),
                RaisedButton(
                  onPressed: () {
                    web(cmd);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(13),
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  color: Colors.orange.shade100,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 5, color: Colors.orangeAccent),
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      child: Text(
                        webdata ?? "\n COMMAND OUTPUT",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
