import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class LaunchInstance extends StatefulWidget {
  TextEditingController ipController;

  LaunchInstance(TextEditingController this.ipController);
  @override
  _LaunchInstanceState createState() => _LaunchInstanceState();
}

class _LaunchInstanceState extends State<LaunchInstance> {
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
    TextEditingController typeController = new TextEditingController();
    TextEditingController countController = new TextEditingController();

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
              hintText: 'AMI ID',
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
            controller: typeController,
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
              hintText: 'Instance Type',
              prefixIcon: Icon(
                FontAwesomeIcons.redhat,
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
            controller: countController,
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
              hintText: 'Count',
              prefixIcon: Icon(
                FontAwesomeIcons.sortNumericDown,
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
                      
                      //web("aws ec2 run-instances --image-id ami-08f63db601b82ff5f --instance-type t2.micro --count 1");
                      web("aws ec2 run-instances --image-id " + idController.text+" --instance-type " +typeController.text + " --count " + countController.text);
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