import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NoArgContaner extends StatefulWidget {
  var ipController;

  NoArgContaner(TextEditingController this.ipController);

  @override
  _NoArgContanerState createState() => _NoArgContanerState();
}

class _NoArgContanerState extends State<NoArgContaner> {
  var webdata;
  TextEditingController ipController = new TextEditingController();

  web(cmd) async {
    var url = 'http://${widget.ipController.text}/cgi-bin/script.py?x=${cmd}';
    var response = await http.get(url);
    setState(() {
      webdata = response.body;
    });
    print(webdata);
    return webdata;
  }

  @override
  Widget build(BuildContext context) {
    List functions = [
      "All Containers",
      "Active Containers",
    ];
    List commands = [
      "sudo docker container ls -a",
      "sudo docker container ls ",
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 90,
            child: ListView.builder(
                itemCount: functions.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(8),
                    child: RaisedButton(
                      onPressed: () {
                        web(commands[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          functions[index],
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      color: Colors.orange.shade100,
                    ),
                  );
                }),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Text(
                webdata ?? "\n COMMAND OUTPUT",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
