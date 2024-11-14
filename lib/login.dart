import 'package:file_authentication/forget_password.dart';
import 'package:file_authentication/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:file_authentication/forget_password.dart';
import 'package:file_authentication/homescreen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      print('User signed in');
    } catch (e) {
      print('Sign-in error: $e');
      _showErrorDialog(e.toString());
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 400,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/download (6).jpeg"),
                    fit: BoxFit.cover)),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 40,
            width: 300,
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 40,
            width: 300,
            child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)))),
          ),
          SizedBox(height: 55),
          SizedBox(
            height: 40,
            width: 300,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 54, 57, 244),
                  foregroundColor: Colors.white),
              onPressed: () {
                _signIn();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homescreen()));
              },
              child: Text('Log in', style: TextStyle(fontSize: 18)),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen()));
                  },
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
