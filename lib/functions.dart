import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> signin(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return 'true';
  } catch (e) {
    return e.toString();
  }
}

Future<String> register_user(String email, String password, String phone_number,
    String name, String id) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    await FirebaseFirestore.instance.collection('user_profile').add({
      'name': name,
      'email': email,
      'password': password,
      'phone_number': phone_number,
      'id': id,
    });
    return 'true';
  } catch (e) {
    return e.toString();
  }
}
