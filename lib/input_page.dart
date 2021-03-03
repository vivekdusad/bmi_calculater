import 'package:bmi_calculator/custom_directry/calculatebmi.dart';
import 'package:bmi_calculator/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'custom_directry/CardContent.dart';
import 'custom_directry/ReusableCard.dart';
import 'custom_directry/bottom_card.dart';

//enums
enum gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  gender selectedGender = gender.male;
  int num_age = 19;
  int num_weight = 87;
  int height = 120;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  color: selectedGender == gender.male
                      ? kactiveCardColor
                      : kinactiveCardColor,
                  child: CardContent(
                    icon: FontAwesomeIcons.mars,
                    text: "Male",
                  ),
                  onPress: () {
                    setState(() {
                      selectedGender = gender.male;
                    });
                  },
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: selectedGender == gender.female
                      ? kactiveCardColor
                      : kinactiveCardColor,
                  child: CardContent(
                    icon: FontAwesomeIcons.venus,
                    text: "Female",
                  ),
                  onPress: () {
                    setState(() {
                      selectedGender = gender.female;
                    });
                  },
                ),
              )
            ],
          )),
          Expanded(
              child: ReusableCard(
            color: kactiveCardColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HEIGHT",
                  style: kText_style,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      height.toString(),
                      style: kBoldText_style,
                    ),
                    Text("cm")
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 18),
                      overlayShape:
                          RoundSliderThumbShape(enabledThumbRadius: 20),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x29EB1555),
                      thumbColor: Color(0xFFEB1555)),
                  child: Slider(
                    value: height.toDouble(),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.toInt();
                      });
                    },
                    min: 120,
                    max: 200,
                  ),
                )
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                color: kactiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    bottomCard(
                      str: "WEIGHT",
                      string: num_weight.toString(),
                      unit: "kg",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        RoundedButton(onPress: (){
                          setState(() {
                            num_weight--;
                          },);

                        },icon: FontAwesomeIcons.minus,),
                        SizedBox(width: 10,),
                        RoundedButton(onPress: (){
                          setState(() {
                            num_weight++;
                          },);
                        },icon: FontAwesomeIcons.plus,),
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: ReusableCard(
                color: kactiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    bottomCard(
                      str: "AGE",
                      string: num_age.toString(),
                      unit: "",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedButton(onPress: (){
                          setState(() {
                            num_age--;
                          },);

                        },icon: FontAwesomeIcons.minus,),
                        SizedBox(width: 10,),
                        RoundedButton(onPress: (){
                          setState(() {
                            num_age++;
                          },);

                        },icon: FontAwesomeIcons.plus,),

                      ],
                    )

                  ],
                ),
              ))
            ],
          )),
          FlatButton(
          onPressed: (){
            Bmi bmi = Bmi(height:height.toDouble(),weight: num_weight.toDouble());
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=>Details(bmiResult: bmi.calculateBmi(),messsage: bmi.getResult(),interperation: bmi.getInterperation(),),
            ));
          },
          child: Text("Next"),
          color: Color(0xFFEB1555),
            height: 60,)
        ],
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {

  final Function onPress;
  final IconData icon;
  RoundedButton({this.onPress,this.icon});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed:onPress,
        child: Icon(icon),
        shape: CircleBorder(),
        // materialTapTargetSize: MaterialTapTargetSize.padded,
        constraints: BoxConstraints(minWidth: 56.0, minHeight: 56.0),
        fillColor: Color(0xFF4c4F5E));

  }
}

// ignore: camel_case_types


