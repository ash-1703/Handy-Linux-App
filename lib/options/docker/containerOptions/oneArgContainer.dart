import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class OneArgContainer extends StatefulWidget {
  var ipController;
  OneArgContainer(TextEditingController this.ipController);

  @override
  _OneArgContainerState createState() => _OneArgContainerState();
}

class _OneArgContainerState extends State<OneArgContainer> {
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
    TextEditingController containerController = new TextEditingController();
    List functions = [
      "Create",
      "Run",
      "Start",
      "Stop",
      "Restart",
      "Remove",
      "Kill",
      "Inspect",
      "Logs",
      "Pause Processes",
      "Unpause Processes",

    ];
    List commands = [
      "sudo docker container create",
      "sudo docker container run -dit ",
      "sudo docker container start",
      "sudo docker container stop",
      "sudo docker container restart",
      "sudo docker container rm",
      "sudo docker container kill",
      "sudo docker container inspect",
      "sudo docker container logs",
      "sudo docker container pause",
      "sudo docker container unpause",
    ];
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: TextField(
            controller: containerController,
            cursorColor: Colors.black,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.orangeAccent, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.orangeAccent, width: 1),
              ),
              hintText: 'Enter the name of Container to take action',
              prefixIcon: Icon(
                FontAwesomeIcons.docker,
                color: Colors.deepOrange,
              ),
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Container(
          height: 90,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
              itemCount: functions.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(8),
                  child: RaisedButton(
                    onPressed: () {
                      web(commands[index] + " " +containerController.text);
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
    ));
  }
}
