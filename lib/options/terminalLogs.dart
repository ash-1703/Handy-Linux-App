import 'package:LinuxApp/firebase/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TerminalLogs extends StatelessWidget {
  TextEditingController ipController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Terminal Logs"),
        backgroundColor: Colors.orange,
      ),
      body: new RetriveData(),
    );
  }
}

class RetriveData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
      stream: dbRef.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');
        return new ListView(
          children: snapshot.data.docs.map((document) {
            return Container(
    padding: EdgeInsets.all(7),
    //height: 100,
    //color: Colors.grey,
    child: RaisedButton(
      onPressed: () {},
      child: Container(
        padding: EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_circle_down,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      document['command'],
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.blueGrey,
                  ),
                  onPressed: () async {
                    dbRef.doc(document.id).delete();
                  },
                )
              ],
            ),
            SizedBox(
              height: 6,
            ),
            new Text(
              document['output'],
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    ),
  );
          }).toList(),
        );
      },
    );
  }
}

Widget LTile(snapshot,  document) {

}
