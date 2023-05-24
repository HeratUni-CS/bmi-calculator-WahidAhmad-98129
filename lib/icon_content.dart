import 'package:flutter/material.dart';
import 'constants.dart';

class iconContetn extends StatelessWidget {
  IconData myIcon;
  String gender;
  iconContetn({required this.myIcon,required this.gender}){
    final IconData myIcon;
    final String gender;
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          myIcon,
          size: 100,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          gender,
          style: kLableTextStyle,
        )
      ],
    );
  }
}