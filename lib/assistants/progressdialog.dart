import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ProgressDialog extends StatelessWidget {

  String message;
  ProgressDialog({required this.message});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(15.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.0)
        ),
    child: Padding(
      padding: EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: [
              SizedBox(width: 6.0,),
              CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(HexColor("#373e40")),),
              SizedBox(width: 26.0,),
              Text(
                message,
                style: TextStyle(color: HexColor("#373e40"), fontSize: 10.0),

              ),

            ],
        ),
      ),
    ),



      ),
    );
  }
}
