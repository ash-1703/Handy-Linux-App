import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

TextEditingController ipController = new TextEditingController();
TextEditingController imageController = new TextEditingController();
var cmd;

class ImageOption extends StatefulWidget {
  @override
  _ImageOptionState createState() => _ImageOptionState();
}

class _ImageOptionState extends State<ImageOption> {
  var webdata;

  web(ip, cmd) async {
    var url = 'http://${ipController.text}/cgi-bin/script.py?x=${cmd}';
    var response = await http.get(url);
    setState(() {
      webdata = response.body;
    });
    print(webdata);
    return webdata;
  }

  @override
  Widget build(BuildContext context) {
    List functions = ["List", "History", "Remove", "Inspect", "Pull" , "Push"];
    List commands = [
      "sudo docker image ls",
      "sudo docker image history ",
      "sudo docker image remove ",
      "sudo docker image inspect ",
      "sudo docker image pull ",
      "sudo docker image push "
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Image Options"),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                    borderSide: BorderSide(color: Colors.orangeAccent, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.orangeAccent, width: 1),
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
              margin: EdgeInsets.all(20),
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
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: imageController,
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
                  hintText: 'Enter the name of Image to take action',
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
              child: ListView.builder(
                  itemCount: functions.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.all(8),
                      child: RaisedButton(
                        onPressed: () {
                          if (index == 0) {
                            web(ipController, commands[index]);
                          } else {
                            var cmd =
                                commands[index] + " " + imageController.text;
                            web(ipController, cmd);
                          }

                          print(index);
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
      ),
    );
  }
}
