import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/card_widget.dart';
import 'package:bmi_calculator/components/option_card_content.dart';
import '../constants.dart';
import 'results_page.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 19;
  Gender selectedGender;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'IndeCalc',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 27.5,
                vertical: 17,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 24,
                    child: Row(
                      children: [
                        Expanded(
                          child: ReusableCard(
                            onPress: () {
                              setState(() {
                                selectedGender = Gender.male;
                              });
                            },
                            colour: selectedGender == Gender.male
                                ? kInactiveCardColour
                                : kActiveCardColour,
                            cardChild: OptionCardContent(
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              assetImage: selectedGender == Gender.male
                                  ? 'images/frame_white.png'
                                  : 'images/frame_grey.png',
                              title: 'FRAME',
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            onPress: () {
                              setState(() {
                                selectedGender = Gender.female;
                              });
                            },
                            colour: selectedGender == Gender.female
                                ? kInactiveCardColour
                                : kActiveCardColour,
                            cardChild: OptionCardContent(
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              assetImage: selectedGender == Gender.female
                                  ? 'images/truss_white.png'
                                  : 'images/truss_grey.png',
                              title: 'TRUSS',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 30,
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'HEIGHT',
                            style: kTitleStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                height.toString(),
                                style: kNumberStyle,
                              ),
                              Text(
                                'cm',
                                style: kTitleStyle,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: kSliderActiveColour,
                              inactiveTrackColor: kSliderInactiveColour,
                              thumbColor: kSliderThumbColour,
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: kSliderThumbRadius),
                              overlayShape: RoundSliderOverlayShape(
                                  overlayRadius: kSliderThumbOverlayRadius),
                              overlayColor: kSliderThumbOverlayColour,
                              trackHeight: kSliderTrackHeight,
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.toInt();
                                });
                              },
                              min: kSliderMinValue,
                              max: kSliderMaxValue,
                            ),
                          )
                        ],
                      ),
                      colour: kActiveCardColour,
                    ),
                  ),
                  Expanded(
                    flex: 30,
                    child: Row(
                      children: [
                        Expanded(
                          child: ReusableCard(
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'WEIGHT',
                                  style: kTitleStyle,
                                ),
                                Text(
                                  weight.toString(),
                                  style: kNumberStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.minus,
                                      onPress: () {
                                        setState(() {
                                          weight--;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPress: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            colour: kActiveCardColour,
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'AGE',
                                  style: kTitleStyle,
                                ),
                                Text(
                                  age.toString(),
                                  style: kNumberStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.minus,
                                      onPress: () {
                                        setState(() {
                                          age--;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPress: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            colour: kActiveCardColour,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            onPress: () {
              CalculatorBrain result =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmi: result.calculateBMI(),
                    interpretation: result.getInterpretation(),
                    resultKeyword: result.getResultKeyword(),
                  ),
                ),
              );
            },
            title: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
