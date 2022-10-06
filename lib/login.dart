import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailCtrl =TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  login(
      String email,
      String password
      )async{
    FirebaseAuth auth = FirebaseAuth.instance;
   await auth.signInWithEmailAndPassword(email: email, password: password).then((value) {
     print(value);
   });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Email'),
          TextField(
            controller: emailCtrl,
          ),
          Text('Password'),
          TextField(controller: passwordCtrl,),
          ElevatedButton(onPressed: (){
            login(emailCtrl.text, passwordCtrl.text);
          }, child: Text('Login By Email')),
        ],
      ),
    );
  }
}
