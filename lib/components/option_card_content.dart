import 'package:flutter/material.dart';
import 'package:inde_calc/constants.dart';

class OptionCardContent extends StatelessWidget {
  final String assetImage;
  final String title;
  final screenWidth;
  final screenHeight;
  final titleColor;
  OptionCardContent(
      {this.screenHeight,
      this.screenWidth,
      this.assetImage,
      this.title,
      this.titleColor});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: (assetImage == null)
              ? null
              : Image(
                  fit: BoxFit.contain,
                  height: screenHeight * 0.12,
                  image: AssetImage(assetImage),
                ),
        ),
        Text(
          title,
          style: TextStyle(
              height: 1.0,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: titleColor,
              letterSpacing: 1),
        ),
      ],
    );
  }
}
