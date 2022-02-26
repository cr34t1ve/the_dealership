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

        child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: DrawerHeader(
                      child: Container(
                        height: 500,
                        child: Column(children:  [
                          CircleAvatar(
                            backgroundColor: Colors.black12,
                            radius: 50,
                            child: Text(
                              'Dealership',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),

                            //Text
                          ),
                          Text(
                            "uname",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Email',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
              ListTile(
                leading: const Icon(
                  Icons.account_circle,
                  size: 30,
                ),
                title: Text('Profile'),
                subtitle: Text("View your account details here"),
                trailing: Icon(Icons.more_vert),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.info,
                  size: 30,
                ),
                title: Text('About'),
                subtitle: Text("Learn about us "),
                trailing: Icon(Icons.more_vert),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.add,
                  size: 30,
                ),
                title: Text('Orders'),
                subtitle: Text("This is the 1st item"),
                trailing: Icon(Icons.more_vert),
                onTap: () {},
              ),
              const SizedBox(
                height: 25,
              ),
              Column(children: [
                ListTile(
                  onTap: () {
                    _showMyDialog();
                  },
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Sign Out",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ]),
              ListTile(
                title: Text('Second item'),
                onTap: () {},
              ),
            ]),
      );

  }
}
