import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Pages/login.dart';

class SignUP extends StatelessWidget {
  late String _email, _password, _fullName, _mobileNumber;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget _backButton() {
      return InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
                child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
              ),
              const Text('Back',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
            ],
          ),
        ),
      );
    }

    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: _backButton(),
            ),
            Text("DEALERSHIP"),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 100,
              width: 180,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/golf.png"),
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),

                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    height: size.height,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("SIGN UP",
                                style: TextStyle(
                                  color: isDarkMode
                                      ? Colors.white
                                      : const Color(0xff070606),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                )),
                          ],
                        ),
                        Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Icon(
                                Icons.person,
                                color: isDarkMode
                                    ? Colors.white
                                    : const Color(0xff070606),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  _fullName = value;
                                },
                                decoration: InputDecoration(
                                  hintText: "Full Name",
                                ),
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Icon(
                                Icons.phone,
                                color: isDarkMode
                                    ? Colors.white
                                    : const Color(0xff070606),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  _mobileNumber = value;
                                },
                                decoration: const InputDecoration(
                                  hintText: "Mobile Number",
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Icon(
                                Icons.alternate_email,
                                color: isDarkMode
                                    ? Colors.white
                                    : const Color(0xff070606),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  _email = value;
                                },
                                decoration: InputDecoration(
                                  hintText: "Email Address",
                                ),
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 16),
                              child: Icon(
                                Icons.lock,
                                color: isDarkMode
                                    ? Colors.white
                                    : const Color(0xff070606),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  _password = value;
                                },
                                decoration: const InputDecoration(
                                  hintText: "Password",
                                ),
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: isDarkMode
                                    ? Colors.white
                                    : Colors.black, //icon bg color
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              // S
                              height: 50.0,
                              child: Center(
                                child: Text('Sign Up',
                                    style: TextStyle(
                                      color: isDarkMode
                                          ? const Color(0xff070606)
                                          : Colors.white,
                                      fontWeight: FontWeight.bold,
                                      // color: Colors.black45,
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    )),
                              ),
                            ),
                          ),
                          onTap: () async {
                            UserCredential user = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: _email.trim(), password: _password.trim());
                            if (user != null) {
                              await FirebaseFirestore.instance
                                  .collection('Users')
                                  .doc(_email)
                                  .set({
                                'FullName': _fullName,
                                'MobileNumber': _mobileNumber,
                                'Email': _email,
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return SignInScreen();
                                }),
                              );
                            } else {
                              print('user does not exist');
                            }
                          },
                        ),
                      ],
                    ),
                  ),
              ),
                ),
            ]),
      ),

    );
  }
}
