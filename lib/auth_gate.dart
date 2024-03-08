import 'package:chap_app/home_page.dart';
import 'package:chap_app/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snapshot) {
        //user id logged in 
      if (snapshot.hasData){
        return const HomePage();
      }
        // user in Not logged in 
        else {
          return const LoginOrRegister();
        }
      } ,),
    );
  }
}