import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_dealership/main.dart';
import 'package:unicons/unicons.dart';

class ForgotPassword extends StatelessWidget {
  static String id = 'forgot-password';
  TextEditingController emailTextEditingController= TextEditingController();

  @override
  void dispose(){

    emailTextEditingController.dispose();
   dispose();
  }



  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size; //check the size of device
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness ==
        Brightness.dark; //check if device is in dark or light mode

    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0), //appbar size
        child: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          automaticallyImplyLeading: true,
          titleSpacing: 0,
          leadingWidth: size.width * 0.15,
          title: Text("Forgot Password"),



          centerTitle: true,

        ),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter Your Email',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              Text(
                'To Reset Your Password',
                style: TextStyle(fontSize:12, color: Colors.grey),
              ),
              TextFormField(
                controller: emailTextEditingController,

                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Email',
                  icon: Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                  errorStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              RaisedButton(
                child: Text('Send Email'),
                onPressed: () {resetPassword(context);},
              ),
              FlatButton(
                child: Text('Sign In'),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
  Future resetPassword(BuildContext context) async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailTextEditingController.text.trim());

    displayToast("Logged-in As A Board Member",context);
  }
  //
  displayToast(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
}
}