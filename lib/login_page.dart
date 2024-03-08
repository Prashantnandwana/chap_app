import 'package:chap_app/auth_service.dart';
import 'package:chap_app/my_button.dart';
import 'package:chap_app/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  //email controller 
  final TextEditingController _emailController =TextEditingController();
  //password controller
  final TextEditingController _pwController = TextEditingController();
  // tap to go to register page
   final Function()? onTap;
    LoginPage({super.key,required this.onTap});

  // login method
  void login(BuildContext context)async {
    //auth service
    final authService=AuthService();
    //try login
    try{
      await authService.signInWithEmailPassword(_emailController.text, _pwController.text,);
    }
    //catch any error
    catch(e){
      showDialog(context: context, builder: (context) => AlertDialog(
         title: Text("e.toString()"),
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
       MyButton(text: "Login",onTap: () => login(context),),
       GestureDetector(onTap: onTap,
        child: Text("not a member register now")),
          ],
        ),
      ),

    );
  }
} 