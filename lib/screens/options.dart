import 'dart:ui';
import 'package:LinuxApp/options/AWS/aws.dart';
import 'package:LinuxApp/options/docker/docker.dart';
import 'package:LinuxApp/options/terminal.dart';
import 'package:LinuxApp/options/terminalLogs.dart';
import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  List features = ["Terminal", "Terminal Logs" , "Docker", "AWS", ];
  List feature_fun = [Terminal(), TerminalLogs(), Docker(), AWS(), ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Linux App"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Center(
            child: ListView.builder(
              itemCount: features.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(8),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => feature_fun[index]));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        features[index],
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    color: Colors.orange.shade100,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
