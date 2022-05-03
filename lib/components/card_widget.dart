import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPress;
  ReusableCard({@required this.colour, this.cardChild, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.symmetric(vertical: 13.5, horizontal: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: colour,
        ),
      ),
    );
  }
}
