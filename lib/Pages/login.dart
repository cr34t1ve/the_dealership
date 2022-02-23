import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_dealership/Pages/homepage.dart';
import 'package:the_dealership/assistants/progressdialog.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'signup.dart';
import 'forgotpassword.dart';
// import 'signup.dart';


class SignInScreen extends StatelessWidget {
  static const String idScreen = "Login";


  //ch
  late String _email, _password;
  TextEditingController emailTextEditingController= TextEditingController();
  TextEditingController passwordTextEditingController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top:15.0),
                child: Text("DEALERSHIP",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 180,
                width: 180,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/yaris.png"),
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("SIGN IN",
                                style: TextStyle(
                                  color: isDarkMode ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                )),
                            FlatButton(
                              color: Colors.black12,
                              textColor: Colors.white,
                              child: Text('Sign Up',
                                  style: TextStyle(
                                    color: isDarkMode ? Colors.white : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )),
                              onPressed: () {
                                //print('Pressed SignUP!');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return SignUP();
                                  }),
                                );
                              },
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 40,top: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.alternate_email,
                                  color: isDarkMode ? Colors.white : Colors.black,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: emailTextEditingController ,
                                  onChanged: (value) {
                                    _email=value;
                                  },
                                  decoration: const InputDecoration(
                                    hintText: "Email Address",
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.lock,
                                  color: isDarkMode ? Colors.white : Colors.black,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: passwordTextEditingController ,
                                  obscureText: true,
                                  onChanged: (value) {
                                   _password=value;
                                  },
                                  decoration: const InputDecoration(
                                    hintText: "Password",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0,left: 150,right: 1),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                ForgotPassword.id,
                              );
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                color: isDarkMode
                                    ? Colors.white
                                    : Colors.black, //icon bg color
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              // color: Color(0xFFFFBD73),
                              // margin: EdgeInsets.only(top: 10.0),
                              // width: double.infinity,
                              height: 50.0,
                              child: Center(
                                child: Text('LogIn',
                                    style: TextStyle(
                                      color: isDarkMode
                                          ? const Color(0xff070606)
                                          : Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    )),
                              ),
                            ),
                            onTap: ()  {
                              loginAndAuthenticateUser(context);

     {

                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void loginAndAuthenticateUser(BuildContext context) async
  {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(message: "Logging you ,Please wait.",);
        }


    );

    Future signInWithEmailAndPassword(String email, String password) async {
      try {
        UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        User? user = result.user;
        return _firebaseAuth;
      } catch (error) {
        print(error.toString());
        return null;
      }
    }


    final User? firebaseUser = (await _firebaseAuth
        .signInWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text
    ).catchError((errMsg) {
      Navigator.pop(context);
      displayToast("Error" + errMsg.toString(), context);
    })).user;
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(
          email: emailTextEditingController.text,
          password: passwordTextEditingController.text);


      if (firebaseUser != null) {
        Navigator.of(context).pushNamed(homepage.idScreen);


        displayToast("Logged-in ",
            context);
      } else {
        displayToast("Error: Cannot be signed in", context);
      }

      //final User? firebaseUser = userCredential.user;
      // if (firebaseUser != null) {
      //   final DatabaseEvent event = await
      //   //Admin.child(firebaseUser.uid).once();
      //   BoardMembers.child(firebaseUser.uid).once();
      //   // if (event.snapshot.value !=Admin) {
      //   //   Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen,
      //   //           (route) => false);
      //   //   displayToast("Logged-in As Admin", context);
      //   // }
      //   if(event.snapshot.value !=BoardMembers){
      //     Navigator.pushNamedAndRemoveUntil(context, VotersScreen.idScreen,
      //             (route) => false);
      //     displayToast("Logged-in As Board Member",
      //         context);
      //    // await _firebaseAuth.signOut();
      //   }

    } catch (e) {
      // handle error
    }


    // FutureBuilder(
    //     future: ,
    //     builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
    //       if (snapshot.hasData) {
    //         return Text(snapshot.data.uid);
    //       }
    // if (firebaseUser != null ){
    //   //save use into to database
    //   Admin.child(firebaseUser.uid).once().then(( DataSnapshot snap){
    //     if(snap.value != null)
    //     {
    //       currentfirebaseUser=firebaseUser;
    //       Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
    //       displayToast("Welcome", context);
//    }
//         else
//         {
//           Navigator.pop(context);
//           _firebaseAuth.signOut();
//           displayToast("User does not exist,Please create new account.", context);
//         }
//       });


  }
  //
  displayToast(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);

// user created

  }
}

class Login_Successfull extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }





}
