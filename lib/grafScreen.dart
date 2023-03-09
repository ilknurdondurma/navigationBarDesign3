import 'package:flutter/material.dart';

class grafScreen extends StatelessWidget {
  const grafScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Text("graf",style: TextStyle(color: Colors.black,fontSize: 25),)),
    );
  }
}
