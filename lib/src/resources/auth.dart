import 'package:cafe_apps2go/src/resources/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _firestoreUsers =
      FirebaseFirestore.instance.collection('users');

  Future signIn(String email, String password) async {
    try {
      UserCredential signIn = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return signIn.user;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  Future signUp(String email, String password) async {
    try {
      UserCredential signUp = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirestoreApi firestore = FirestoreApi();
      signIn(email, password);
      firestore.saveUser(email.substring(0, email.indexOf('@')), email);
      return signUp.user;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  User logedUser() {
    return _auth.currentUser;
  }

  void signOut() {
    _auth.signOut();
  }
}
