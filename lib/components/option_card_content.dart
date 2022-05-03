import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class OptionCardContent extends StatelessWidget {
  final String assetImage;
  final String title;
  final screenWidth;
  final screenHeight;
  OptionCardContent(
      {@required this.screenHeight,
      @required this.screenWidth,
      @required this.assetImage,
      @required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Image(
            fit: BoxFit.contain,
            height: screenHeight * 0.12,
            image: AssetImage(assetImage),
          ),
        ),
        Text(
          title,
          style: kTitleStyle,
        ),
      ],
    );
  }
}
