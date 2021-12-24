import 'package:flutter/material.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
//import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Firestore App',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.orangeAccent,
                fontSize: 30,
                fontWeight: FontWeight.w900)),
        leading: Image.asset(
          'assets/f4.png',
          width: 40,
          fit: BoxFit.cover,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.deepOrange,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage('assets/f5.png'),
                alignment: Alignment.topCenter,
                fit: BoxFit.fitHeight,
              ),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.orange,
              //     offset: Offset(0, 10),
              //     spreadRadius: 0,
              //     blurRadius: 50,
              //   )
              // ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 40)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 70),
            child: SignInWithEmail(
              onPressed: () {
                Navigator.pushNamed(context, 'login');
              },
              buttonColor: Color(0xFFFF9000),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
