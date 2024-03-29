import 'package:chap_app/auth_service.dart';
import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void logout(){
    //get auth service
    final _auth = AuthService();
    _auth.signOut();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("home"),
      actions: [
        //logout button 
        IconButton(onPressed: logout, icon: Icon(Icons.logout))
      ],), 
    );
  }
}