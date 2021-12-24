import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
 DocumentReference getUserDBRef()  {
    final User user =  auth.currentUser;
    DocumentReference userDBRef = FirebaseFirestore.instance.collection('Database').doc(user.uid);
    return userDBRef;
}
