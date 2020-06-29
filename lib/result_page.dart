import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
class result_page extends StatelessWidget {

  result_page({@required this.bmiresult, @required this.resultText , @required this.interpretation});

  final String bmiresult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCLATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Text('YOUR RESULT',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50.0

            ),),
          ),
          Expanded(
            flex: 5,
            child: reusableCard(
              colour: Color(0xFF1D1E33),
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreenAccent
                    ),
                  ),
                  Text(
                    bmiresult,
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,

                    ),
                  ),
                  Text(
                    interpretation, textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,

                    ),
                  )
                ],

              ),

            ),

          )
        ],
      ),
    );
  }
}
