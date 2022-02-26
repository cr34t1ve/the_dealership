import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_dealership/assistants/size_config.dart';

class MyDrawer extends StatefulWidget {
// const MyDrawer({ required Key key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {




  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sign Out'),
          backgroundColor: Colors.white,
          content: SingleChildScrollView(
            child: Column(
              children: const <Widget>[
                Text('Are you certain you want to Sign Out?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                print('yes');
                FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
                // Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          //Drawer Header
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                // Text(
                //   //uName,
                //   style: TextStyle(
                //       fontSize: 28.0,
                //       color: Colors.black),
                // ),
                SizedBox(
                  height: 6.0,
                ),
                // Text(
                //   uPhone,
                //   style: TextStyle(
                //       fontSize: 18.0,
                //       color: Colors.black),
                // ),
                SizedBox(
                  height: 6.0,
                ),
              ],
            ),
          ),
          Column(children: [
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              isThreeLine: false,
              dense: true,
              leading: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: Text(
                "Visit Profile",
                style: TextStyle(fontSize: 15.0),
              ),
              subtitle: Text("Personal Details"),
              trailing: Icon(
                Icons.keyboard_arrow_right_rounded,
                color: Colors.black,
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                child: Divider(
                  color: Colors.black.withOpacity(0.5),
                )),
            Column(children: [
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/history');
                },
                dense: true,
                leading: Icon(
                  Icons.history,
                  color: Colors.black,
                ),
                title: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/history');
                    },
                    child: Text(
                      "Delivery History",
                      style: TextStyle(fontSize: 15.0),
                    )),
                subtitle: Text("Keep Track of all Deliveries"),
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Colors.black,
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                  child: Divider(
                    color: Colors.black.withOpacity(0.5),
                  )),
              Column(children: [
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/about');
                  },
                  dense: true,
                  leading: Icon(
                    Icons.info,
                    color: Colors.black,
                  ),
                  title: Text(
                    "About",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  subtitle: Text("Terms & Conditions, Privacy Policy"),
                  trailing: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: Colors.black,
                  ),
                ),
              ]),
            ]),
          ]),
          Spacer(),

          SafeArea(
            bottom: true,
            child: Column(children: [
              ListTile(
                onTap: () {
                  _showMyDialog();
                },
                dense: true,
                leading: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                title: Text(
                  "Sign Out",
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(25.0),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
