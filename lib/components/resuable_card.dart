import 'package:flutter/material.dart';

class ResuableCard extends StatelessWidget {

  ResuableCard({required this.colour,this.cardChild,this.onpress}) ;
    final Color? colour;
    final Widget? cardChild;
    final Function()? onpress;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color:colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
