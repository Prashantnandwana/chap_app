import 'package:chap_app/auth_service.dart';
import 'package:chap_app/my_button.dart';
import 'package:chap_app/my_textfield.dart';
import 'package:flutter/material.dart';
 class RegisterPage extends StatelessWidget {
    RegisterPage({super.key, this.onTap});
 final TextEditingController _emailController=TextEditingController();
 final TextEditingController _pwController =TextEditingController();
 final TextEditingController _confirmPwController =TextEditingController();
   // tap to go to register page
   final Function()? onTap;

 //register method
 void register(BuildContext context){
  //get auth service
  final _auth =AuthService();
  if (_pwController.text==_confirmPwController.text){
    try{
      _auth.signInWithEmailPassword(_emailController.text, _pwController.text);
    }catch(e){
      showDialog(context: context, builder: (context) => AlertDialog(
         title: Text("e.toString()"),
      ),
      );
    }
  }
  //password dont match show error to user
  else{
    showDialog(context: context, builder: (context) => AlertDialog(
         title: Text("password did nit match"),
      ),);
  }
 }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(  
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
      Icon(Icons.message,color: Theme.of(context).colorScheme.primary,),
       Text("welcome"),
       MyTextField(hintText: "email",obscureText: false,controller: _emailController),
       MyTextField(hintText: "password",obscureText: true,controller: _pwController),
        MyTextField(hintText: "conf password",obscureText: true,controller: _confirmPwController),
       MyButton(text: "Register",onTap: () => register(context),),
       GestureDetector(onTap: onTap,
        child: Text("already a member login now")),
          ],
        ),
      ),

    );
   }
 }