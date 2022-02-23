import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'configMaps.dart';

void getCurrentOnlineUserInfo() async {
  User firebaseUser = FirebaseAuth.instance.currentUser!;
  String userId = firebaseUser.uid;
  DatabaseReference userRef = FirebaseDatabase.instance.reference().child(
      "Clients").child(userId);
}
class Users {
  String? key;
  String? id;
  String? email;
  String? name;
  String? phone;


  Users({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,


  });

  // Users.fromSnapshot(DataSnapshot dataSnapShot) {
  //   id = dataSnapShot.key;
  //   email = dataSnapShot.value["email"];
  //   name = dataSnapShot.value["name"];
  //   phone = dataSnapShot.value["phone"];
  //  // DriverStatus= dataSnapShot.value["DriverStatus"];
  // }
}

