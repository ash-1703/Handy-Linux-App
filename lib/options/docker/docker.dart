import 'dart:ui';

import 'package:LinuxApp/options/docker/containerOptions/containerOptions.dart';
import 'package:LinuxApp/options/docker/imageOptions/imageOption.dart';
import 'package:flutter/material.dart';

class Docker extends StatelessWidget {
  List functions = [
    "Image",
    "Container",
  ];
  List functions_list = [
    ImageOption(),
    ContainerOption(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Docker"),
          backgroundColor: Colors.orange,
        ),
        body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                    child: Container(
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Center(
                        child: ListView.builder(
                          itemCount: functions.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.all(8),
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              functions_list[index]));
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
                          },
                        ),
                      ),
                    ),
                  ),
                ))
              ]),
        ));
  }
}
