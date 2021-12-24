import 'package:LinuxApp/options/docker/containerOptions/noArgContainer.dart';
import 'package:LinuxApp/options/docker/containerOptions/oneArgContainer.dart';
import 'package:LinuxApp/options/docker/containerOptions/twoArgContainer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContainerOption extends StatelessWidget {
  TextEditingController ipController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    List functions = ["List", "Create", "Start", "Stop", "Restart", "Pause"];
    List functions_list = [];
    return Scaffold(
        appBar: AppBar(
          title: Text("Container Options"),
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
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
            color: Colors.grey.shade300,
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 1000,
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  title: Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
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
                  elevation: 0,
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                  bottom: TabBar(
                    labelColor: Colors.black,
                    indicatorColor: Colors.orange,
                    tabs: [
                      Tab(text: "Options"),
                      Tab(text: "List"),
                      Tab(text: "Rename"),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    OneArgContainer(ipController),
                    NoArgContaner(ipController),
                    TwoArgContainer(ipController),
                  ],
                ),
              ),
            ),
          )
        ])));
  }
}
