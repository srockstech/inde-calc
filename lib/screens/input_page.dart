import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/card_widget.dart';
import 'package:bmi_calculator/components/option_card_content.dart';
import '../constants.dart';
import 'results_page.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int members = 1;
  int joints = 0;
  int externalReactions = 0;
  int releasedReactions = 0;
  StructureType selectedStructure = StructureType.frame;
  Dimensions dimension = Dimensions.two;
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
                        //Structures
                        Expanded(
                          child: ReusableCard(
                            onPress: () {
                              setState(() {
                                selectedStructure = StructureType.frame;
                              });
                            },
                            colour: selectedStructure == StructureType.frame
                                ? kInactiveCardColour
                                : kActiveCardColour,
                            cardChild: OptionCardContent(
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              assetImage:
                                  selectedStructure == StructureType.frame
                                      ? 'images/frame_white.png'
                                      : 'images/frame_grey.png',
                              title: 'FRAME',
                              titleColor:
                                  selectedStructure == StructureType.frame
                                      ? Colors.white
                                      : Color(0xFF8D8E98),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            onPress: () {
                              setState(() {
                                selectedStructure = StructureType.truss;
                              });
                            },
                            colour: selectedStructure == StructureType.truss
                                ? kInactiveCardColour
                                : kActiveCardColour,
                            cardChild: OptionCardContent(
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              assetImage:
                                  selectedStructure == StructureType.truss
                                      ? 'images/truss_white.png'
                                      : 'images/truss_grey.png',
                              title: 'TRUSS',
                              titleColor:
                                  selectedStructure == StructureType.truss
                                      ? Colors.white
                                      : Color(0xFF8D8E98),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Dimensions
                  Expanded(
                    flex: 10,
                    child: Row(
                      children: [
                        Expanded(
                          child: ReusableCard(
                            onPress: () {
                              setState(() {
                                dimension = Dimensions.two;
                              });
                            },
                            colour: dimension == Dimensions.two
                                ? kInactiveCardColour
                                : kActiveCardColour,
                            cardChild: OptionCardContent(
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                              title: '2D',
                              titleColor: dimension == Dimensions.two
                                  ? Colors.white
                                  : Color(0xFF8D8E98),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            onPress: () {
                              setState(() {
                                dimension = Dimensions.three;
                              });
                            },
                            colour: (dimension == Dimensions.three)
                                ? kInactiveCardColour
                                : kActiveCardColour,
                            cardChild: OptionCardContent(
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                              title: '3D',
                              titleColor: dimension == Dimensions.three
                                  ? Colors.white
                                  : Color(0xFF8D8E98),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 24,
                    child: Row(
                      children: [
                        Expanded(
                          child: ReusableCard(
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'MEMBERS',
                                  style: kTitleStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: <Widget>[
                                    Text(
                                      members.toString(),
                                      style: kNumberStyle,
                                    ),
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
                                        overlayRadius:
                                            kSliderThumbOverlayRadius),
                                    overlayColor: kSliderThumbOverlayColour,
                                    trackHeight: kSliderTrackHeight,
                                  ),
                                  child: Slider(
                                    value: members.toDouble(),
                                    onChanged: (double newValue) {
                                      setState(() {
                                        members = newValue.toInt();
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
                          child: ReusableCard(
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: 20),
                                Text(
                                  'JOINTS',
                                  style: kTitleStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: <Widget>[
                                    Text(
                                      joints.toString(),
                                      style: kNumberStyle,
                                    ),
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
                                        overlayRadius:
                                            kSliderThumbOverlayRadius),
                                    overlayColor: kSliderThumbOverlayColour,
                                    trackHeight: kSliderTrackHeight,
                                  ),
                                  child: Slider(
                                    value: joints.toDouble(),
                                    onChanged: (double newValue) {
                                      setState(() {
                                        joints = newValue.toInt();
                                      });
                                    },
                                    min: kSliderMinValue,
                                    max: kSliderMaxValue,
                                  ),
                                ),
                              ],
                            ),
                            colour: kActiveCardColour,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 24,
                    child: Row(
                      children: [
                        Expanded(
                          child: ReusableCard(
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 5),
                                Text(
                                  'EXT. RXNS.',
                                  style: kTitleStyle,
                                ),
                                Text(
                                  externalReactions.toString(),
                                  style: kNumberStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.minus,
                                      onPress: () {
                                        setState(() {
                                          externalReactions--;
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
                                          externalReactions++;
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
                                SizedBox(height: 5),
                                Text(
                                  'REL. RXNS.',
                                  style: kTitleStyle,
                                ),
                                Text(
                                  releasedReactions.toString(),
                                  style: kNumberStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.minus,
                                      onPress: () {
                                        setState(() {
                                          releasedReactions--;
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
                                          releasedReactions++;
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
              CalculatorBrain result = CalculatorBrain(
                members: members,
                joints: joints,
                externalReactions: externalReactions,
                releasedReactions: releasedReactions,
                structure: selectedStructure,
                dimension: dimension,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    staticIndeterminacy: result.calculateStaticIndeterminacy(),
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
