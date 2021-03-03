import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/custom_directry/ReusableCard.dart';
import 'package:bmi_calculator/custom_directry/calculatebmi.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  String bmiResult,interperation,messsage;


  Details({this.bmiResult, this.interperation, this.messsage});

  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
        appBar: AppBar(
          title: Text("Details"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Your Result",style: kBoldText_style,),
              Expanded(child: ReusableCard(color: kactiveCardColor,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Text(messsage.toUpperCase(),style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900
                          ,color: Colors.green
                      )),
                      Text(bmiResult,style: TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.w900
                      ),),
                      Text(interperation,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,

                      ),

                      ),


                    ],
                  ),),flex: 5,),
              FlatButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Recalculate"),
                color: Color(0xFFEB1555),
                minWidth: double.infinity,
              height: 60,)
            ],
          )
        ),
    );
  }
}
