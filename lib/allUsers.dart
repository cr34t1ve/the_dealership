import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'configMaps.dart';

void getCurrentOnlineUserInfo() async {
  User firebaseUser = FirebaseAuth.instance.currentUser;
  String userId = firebaseUser.uid;
  DatabaseReference userRef = FirebaseDatabase.instance.reference().child("users").child(userId);


  userRef.once().then((DataSnapshot dataSnapShot) {
    if (dataSnapShot.value != null) {
      userCurrentInfo = Users.fromSnapshot(dataSnapShot);
    }
  });
}

class Users {
  String key;
  String id;
  String email;
  String name;
  String phone;
  String DriverStatus;

  Users({
    this.id,
    this.email,
    this.name,
    this.phone,
    this.DriverStatus,

  });

  Users.fromSnapshot(DataSnapshot dataSnapShot) {
    id = dataSnapShot.key;
    email = dataSnapShot.value["email"];
    name = dataSnapShot.value["name"];
    phone = dataSnapShot.value["phone"];
    DriverStatus= dataSnapShot.value["DriverStatus"];
  }
}

class RideRequest {
  String key;
  String id;
  String car_details;
  String client_name;
  String client_phone;
  String created_at;
  String driver_id;
  String driver_name;
  String driver_phone;
  String dropoff_address;
  String pickup_address;
  String ride_type;

  RideRequest({
    this.id,
    this.car_details,
    this.client_name,
    this.client_phone,
    this.created_at,
    this.driver_id,
    this.driver_name,
    this.driver_phone,
    this.dropoff_address,
    this.pickup_address,
    this.ride_type,
  });


  RideRequest.fromSnapshot(DataSnapshot dataSnapShot) {
    id = dataSnapShot.key;
    car_details = dataSnapShot.value["client_name"];
    client_name = dataSnapShot.value["client_name"];
    client_phone = dataSnapShot.value["client_phone"];
    created_at = dataSnapShot.value[" created_a"];
    driver_id = dataSnapShot.value["driver_id"];
    driver_name=dataSnapShot.value["driver_name"];
    driver_phone=dataSnapShot.value["driver_phone"];
    dropoff_address=dataSnapShot.value["dropoff_address"];
    pickup_address=dataSnapShot.value["pickup_address"];
    ride_type=dataSnapShot.value["ride_type"];
  }
}