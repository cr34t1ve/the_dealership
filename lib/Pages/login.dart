import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../signup.dart';
// import 'signup.dart';

class SignInScreen extends StatelessWidget {
  //ch
  // String _email, _password;
  // static String email;
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top:20.0),
              child: Text("DEALERSHIP"),
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
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
                              onChanged: (value) {
                                //_email=value;
                              },
                              decoration: const InputDecoration(
                                hintText: "Email Address",
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
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
                            obscureText: true,
                            onChanged: (value) {
                              //_password=value;
                            },
                            decoration: const InputDecoration(
                              hintText: "Password",
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
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
                        onTap: () async {
                          UserCredential user = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: "_email", password: "_password");
                          if (user != null) {
                            //email = _email;
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return Login_Successfull();
                              }),
                            );
                          } else {
                            print('user does not exist');
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
