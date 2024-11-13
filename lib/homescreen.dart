import 'package:firebase_auth/firebase_auth.dart';
import 'package:file_authentication/login.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  void signOut() async {
    try {
      await FirebaseAuth.instance.signOut();

      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen"), actions: [
        IconButton(
          onPressed: () {
            signOut();
          },
          icon: Icon(Icons.logout),
        ),
      ]),
    );
  }
}
