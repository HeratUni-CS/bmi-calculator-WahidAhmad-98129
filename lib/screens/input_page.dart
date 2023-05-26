import 'package:bmi2/calculator_brain.dart';
import 'package:bmi2/screens/result_page.dart';
import 'package:flutter/material.dart';
import '../components/buttom_button.dart';
import '../components/icon_content.dart';
import '../components/resuable_card.dart';
import '../components/round_icon_button.dart';
import '../constants.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';


  enum Gendre{
    male,
    female,
  }

class InputPage extends StatefulWidget {

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

   Gendre? selectedGender;
   int height=180;
   int weight=30;
   int age=20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
        // backgroundColor: Color(0xFF0A0E21),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(
                  child: ResuableCard(
                    onpress:(){
                      setState(() {
                        selectedGender = Gendre.male;
                      });
                    },
                    colour: selectedGender == Gendre.male ? kActiveCardColor: kInactiveCardColor,
                    cardChild: iconContetn(
                      myIcon: Icons.male,
                      gender: 'MALE',
                    ),
                  ),
                ),
              Expanded(
                child: ResuableCard(
                  onpress:(){
                    setState(() {
                      selectedGender = Gendre.female;
                    });
                  },
                colour: selectedGender == Gendre.female ? kActiveCardColor: kInactiveCardColor,
                cardChild: iconContetn(
                  myIcon: Icons.female,
                  gender: 'FEMALE',
                ),
              ),),
            ],
          ),),
          Expanded(child: ResuableCard(
            colour: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Height',
                  style: kLableTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                 children: [
                   Text(
                     height.toString(),
                     style: KnumberTextStyle,
                   ),
                   Text(
                     'cm',
                     style:TextStyle(
                       fontSize: 20,
                     ),
                   ),

                 ]
                ),
               SliderTheme(
                   data: SliderTheme.of(context).copyWith(
                     inactiveTickMarkColor: Color(0xFF8D8E98),
                     activeTickMarkColor: Colors.white,
                     thumbColor: Color(0xFFEB1555),
                     overlayColor: Color(0x29EB1555),
                     thumbShape:
                       RoundSliderThumbShape(enabledThumbRadius: 15.0),
                     overlayShape:
                       RoundSliderOverlayShape(
                         overlayRadius: 30.0,
                       )
                   ),
                   child: Slider(
                          value: height.toDouble(),
                     min:120.0,
                     max: 220,
                     onChanged: (double newValue){
                            setState(() {
                              height=newValue.round();
                            });
                     },

                   ),),
              ]
            ),
          ),),
          Expanded(child: Row(
            children: [
              Expanded(child: ResuableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Weight',
                      style: kLableTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: KnumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon:Icons.minimize,
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },

                        ),
                          SizedBox(
                            width: 10,
                          ),
                        RoundIconButton(
                          icon:Icons.add,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),),
              Expanded(child: ResuableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: kLableTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: KnumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon:Icons.minimize,
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },

                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RoundIconButton(
                          icon:Icons.add,
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),),
            ],
          ),),
          BottomButton(buttonTitle: 'CALCULATE', onTap:  (){
            CalcutatorBrain calc = CalcutatorBrain(height: height,weight: weight);
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => ResultPage(
                bimResult: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              )),
            );
          },),
        ],
      ),
    );
  }
}







