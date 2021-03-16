import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  Function konvertHandler;
  Convert({Key key, @required this.konvertHandler});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: MaterialButton(
        onPressed: konvertHandler,
        color: Colors.blueAccent,
        textColor: Colors.white,
        child: Text("Hitung Kalori Terbakar"),
      ),
    );
  }
}