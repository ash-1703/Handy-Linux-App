import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class TwoArgContainer extends StatefulWidget {
  TextEditingController ipController;

  TwoArgContainer(TextEditingController this.ipController);

  @override
  _TwoArgContainerState createState() => _TwoArgContainerState();
}

class _TwoArgContainerState extends State<TwoArgContainer> {
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
    TextEditingController fromController = new TextEditingController();
    TextEditingController toController = new TextEditingController();

    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: TextField(
            controller: fromController,
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
              hintText: 'Current Name',
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
          margin: EdgeInsets.all(10),
          child: TextField(
            controller: toController,
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
              hintText: 'Required Name',
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
        RaisedButton(
                    onPressed: () {
                      web("sudo docker container rename" + " " +fromController.text+ " " +toController.text);
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
