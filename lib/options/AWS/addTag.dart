import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class addTag extends StatefulWidget {
  TextEditingController ipController;

  addTag(TextEditingController this.ipController);
  @override
  _addTagState createState() => _addTagState();
}

class _addTagState extends State<addTag> {
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
    TextEditingController idController = new TextEditingController();
    TextEditingController nameController = new TextEditingController();

    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: TextField(
            controller: idController,
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
              hintText: 'Resource ID of Instance',
              prefixIcon: Icon(
                FontAwesomeIcons.aws,
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
            controller: nameController,
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
              hintText: 'Name',
              prefixIcon: Icon(
                Icons.text_fields,
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
            web("aws ec2 create-tags --resources " +
                idController.text +
                " --tags Key=Name,Value=MyInstance " +
                nameController.text);
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
