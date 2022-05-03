import 'package:bmi_calculator/components/card_widget.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  final String bmi;
  final String resultKeyword;
  final String interpretation;
  ResultsPage(
      {@required this.bmi,
      @required this.resultKeyword,
      @required this.interpretation});
  @override
  Widget build(BuildContext context) {
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
                        'Your Result',
                        style: kResultScreenTitleStyle,
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
                              resultKeyword,
                              style: TextStyle(
                                color: (resultKeyword == 'NORMAL')
                                    ? Color(0xFF2BD471)
                                    : Colors.red,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            Text(
                              bmi,
                              style: kResultNumberTextStyle,
                            ),
                            Text(
                              interpretation,
                              style: kResultDescriptionStyle,
                              textAlign: TextAlign.center,
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
