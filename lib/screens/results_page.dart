import 'package:flutter/material.dart';
import 'package:inde_calc/components/card_widget.dart';
import 'package:inde_calc/constants.dart';

import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  final String staticIndeterminacy;
  final String resultKeyword;
  Color color;
  ResultsPage(
      {@required this.staticIndeterminacy, @required this.resultKeyword});
  @override
  Widget build(BuildContext context) {
    if (resultKeyword == 'DETERMINATE & STABLE') {
      color = Color(0xFF2BD471);
    } else if (resultKeyword == 'INDETERMINATE') {
      color = Colors.deepOrangeAccent;
    } else {
      color = Colors.red;
    }

    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          title: Text(
        'IndeCalc',
        style: TextStyle(fontSize: 24),
      )),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 27.5, vertical: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        'The Static Indeterminacy is',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 2,
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 55.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              staticIndeterminacy,
                              style: kResultNumberTextStyle,
                            ),
                            Column(
                              children: [
                                Text(
                                  'The structure is',
                                  style: kResultDescriptionStyle,
                                ),
                                Text(
                                  resultKeyword,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: color,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            onPress: () {
              Navigator.pop(context);
            },
            title: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
