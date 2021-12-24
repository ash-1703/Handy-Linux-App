import 'dart:ui';

import 'package:LinuxApp/options/AWS/addTag.dart';
import 'package:LinuxApp/options/AWS/launchInstace.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AWS extends StatelessWidget {
  TextEditingController ipController = new TextEditingController();
  TextEditingController accessKeyController = new TextEditingController();
  TextEditingController secreteKeyController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController outputFormatController = new TextEditingController();

  createTextField(hinttext, preIcon, controller) {
    return Container(
      //margin: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: controller,
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
          hintText: hinttext,
          prefixIcon: Icon(
            preIcon,
            color: Colors.deepOrange,
          ),
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  showDialogForConfig(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text("AWS CONFIGURE")),
            content: Column(
              children: [
                createTextField('Enter the server IP',
                    FontAwesomeIcons.networkWired, ipController),
                SizedBox(height: 30),
                createTextField(
                    'Access Key ', Icons.vpn_key, accessKeyController),
                SizedBox(height: 10),
                createTextField(
                    'Secret Key', FontAwesomeIcons.key, secreteKeyController),
                SizedBox(height: 10),
                createTextField(
                    'Region Name', Icons.location_pin, locationController),
                SizedBox(height: 10),
                createTextField('Output Format', FontAwesomeIcons.terminal,
                    outputFormatController),
                SizedBox(height: 10),
              ],
            ),
            actions: [
              RaisedButton(
                  child: Text("Submit"),
                  onPressed: () {
                    print("hello");
                  })
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Amazon Web Services"),
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
          child: Container(
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
                        hintText: 'Enter the Public IP',
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
                            //color: Colors.black,
                            padding: EdgeInsets.all(10),
                            child: RaisedButton(
                                color: Colors.orange.shade100,
                                child: Text(
                                  "Configure your AWS",
                                  style: TextStyle(fontSize: 15),
                                ),
                                onPressed: () {
                                  showDialogForConfig(context);
                                }),
                          ),
                          elevation: 0,
                          backgroundColor: Colors.white,
                          automaticallyImplyLeading: false,
                          bottom: TabBar(
                            labelColor: Colors.black,
                            indicatorColor: Colors.orange,
                            tabs: [
                              Tab(text: "Launch Instance"),
                              Tab(text: "Tags"),
                              Tab(text: "Other"),
                            ],
                          ),
                        ),
                        body: TabBarView(
                          children: [
                            LaunchInstance(ipController),
                            addTag(ipController),
                              Center(child: Text("Under development"))
                            ],
                        ),
                      ),
                    ),
                  )
                ]),
          ),
        ));
  }
}
