import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_comtent.dart';
import 'reusable_card.dart';
import 'result_page.dart';
import 'functionality.dart';
const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour= Color(0xFF111328);

enum Gender {
  male,
  female,
}



class InputPage extends StatefulWidget {
@override



_InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Color MaleCardColour = inactiveCardColour;
  Color FemaleCardColour = inactiveCardColour;

  void changecolour(Gender selectedgender)
  {
    if(selectedgender == Gender.male)
      if(MaleCardColour == inactiveCardColour)
        {
          MaleCardColour=activeCardColour;
        }
    else
      MaleCardColour=inactiveCardColour;
    if(selectedgender == Gender.female) {
      if (FemaleCardColour == inactiveCardColour) {
        FemaleCardColour = activeCardColour;
      }
      else
        FemaleCardColour = inactiveCardColour;
    }
  }
  int height = 180;
  int weight = 60;
  int age = 20;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                     setState(() {
                       changecolour(Gender.male);
                     });
                    },
                    child: reusableCard(
                      cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE'),
                      colour: MaleCardColour,
                    ),
                  )
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                     setState(() {
                       changecolour(Gender.female);
                     });
                    },
                    child: reusableCard(
                      cardChild: IconContent(icon: FontAwesomeIcons.venus,label: 'Female'),
                      colour: FemaleCardColour,
                    ),
                  )
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: reusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: <Widget>[
                        Text(
                          'Height',
                          style: TextStyle(
                            fontSize: 18 .0,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              'cm',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xFF8D8E98),
                              ),

                            )
                          ],
                        ),
                        Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          activeColor: Color(0xFFEB1555),
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newvalue){
                            setState(() {
                              height= newvalue.round();
                            });
                          },
                        ),
                      ],

                    ),
                    colour: activeCardColour,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: reusableCard(
                      colour: activeCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                       Text(
                        'Weight',
                         style: TextStyle(
                           fontSize: 18.0,
                        color: Color(0xFF8D8E98),
                         ),
                       ),
                         Text(
                           weight.toString(),
                           style: TextStyle(
                             fontSize: 50.0,
                             fontWeight: FontWeight.w900,
                           ),

                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                             Roundiconbutton(
                               icon: FontAwesomeIcons.minus,
                               onPressed: (){
                                 setState(() {
                                   weight--;
                                 });
                               },
                             ),
                             SizedBox(
                               width: 15.0,
                             ),
                             Roundiconbutton(
                               icon: FontAwesomeIcons.plus,
                               onPressed: (){
                                 setState(() {
                                   weight++;
                                 });
                               },
                             ),
                           ],
                         )
                       ],
                      ),

                    ),
                ),

                Expanded(
                child: reusableCard(
                  colour: activeCardColour,
                  cardChild: Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    Text(
                    'Age',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFF8D8E98),
                    ),
                  ),
                  Text(
                    age.toString(),
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w900,
                    ),

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Roundiconbutton(
                        icon: FontAwesomeIcons.minus,
                        onPressed: (){
                          setState(() {
                            age--;
                          });
                        },
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Roundiconbutton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: (){
                          setState(() {
                            age++;
                          });
                        },
                      ),
                    ],

                  ),
                ],
                ),
                ),
               ),





        ],
            ),

    ),

          GestureDetector(
            onTap: (){

              CalculatorBrain calc = CalculatorBrain(height: height , weight: weight);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>result_page(
                    bmiresult: calc.CalculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getIntrpretation(),

                  )));

            },

            child: Container(
              height: 70.0,
              color: Colors.pink,
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500
                  ),

                ),
              ),
            ),
          )
    ],
    ),
    );
  }
}



class Roundiconbutton extends StatelessWidget {
  @override
  Roundiconbutton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}


