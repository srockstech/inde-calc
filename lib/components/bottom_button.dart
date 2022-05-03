import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final Function onPress;
  final String title;
  BottomButton({@required this.onPress, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          color: kCalculateButtonColour,
          child: Center(
            child: Text(
              title,
              style: kLargeButtonTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
