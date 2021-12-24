import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:LinuxApp/firebase/getUser.dart';

DocumentReference putRef = getUserDBRef();
CollectionReference dbRef = FirebaseFirestore.instance.collection("Database/"+putRef.id+"/TerminalLogs");

