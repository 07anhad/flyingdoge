import 'package:flutter/material.dart';

class MyDoge extends StatelessWidget {
  const MyDoge({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:150,
      width:150,
      child: Image.asset(
        'lib/images/doge.png',
      ),
    );
  }
}