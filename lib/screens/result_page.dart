import 'package:bmi2/components/buttom_button.dart';
import 'package:bmi2/components/resuable_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
   ResultPage({required this.bimResult,required this.resultText,required this.interpretation});
  final String bimResult;
  final String resultText;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(20.0),
            alignment:Alignment.bottomLeft,
            child: Text('Your Result',
            style:kTitleTextStyle,
            ),
          )),
          Expanded(
            flex: 5,
            child: ResuableCard(colour: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  resultText.toUpperCase(),
                style: kResultTextStyle,),
                Text(
                  bimResult,
                  style: kBMITextStyle,
                ),
                Text(
                  interpretation,
                  textAlign: TextAlign.center,
                  style: kBodyTextStyle,
                ),
              ],
            ),),
          ),
          BottomButton(
              onTap: (){
                Navigator.pop(context);
              }, buttonTitle: 'RE-CALCULATE')
        ],
      )
    );
  }
}
