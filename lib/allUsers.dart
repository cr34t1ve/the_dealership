import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'configMaps.dart';

 Future<void> getCurrentOnlineUserInfo() async {
   firebaseUser = await FirebaseAuth.instance.currentUser!;
   String userId = firebaseUser!.uid;
   DatabaseReference userRef = FirebaseDatabase.instance.reference().child(
       "Clients").child(userId);

   final snapshot = await userRef.get(); // you
   if (snapshot.value != null) {
     userCurrentInfo = Clients.fromSnapshot(snapshot) as User?;
   }
 }


class Clients {
  String ?key;
  String? id;
  String? email;
  String? name;
  String? phone;


  Clients({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,


  });

  Clients.fromSnapshot(DataSnapshot dataSnapShot) {
    id = dataSnapShot.key!;
    var data = dataSnapShot.value as Map?;
    name = data?["client_name"];
    // client_name = dataSnapShot.value["client_name"];
    // client_phone = dataSnapShot.value["client_phone"];
    // created_at = dataSnapShot.value[" created_a"];
    // driver_id = dataSnapShot.value!["driver_id"];
    // driver_name=dataSnapShot.value["driver_name"];
    // driver_phone=dataSnapShot.value["driver_phone"];
    // dropoff_address=dataSnapShot.value["dropoff_address"];
    // pickup_address=dataSnapShot.value["pickup_address"];
    // ride_type=dataSnapShot.value["ride_type"];
  }


}

