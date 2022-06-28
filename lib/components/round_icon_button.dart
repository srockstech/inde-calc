import 'package:flutter/material.dart';
import 'package:inde_calc/constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;
  RoundIconButton({@required this.icon, @required this.onPress});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      shape: CircleBorder(),
      fillColor: kRoundedIconButtonColor,
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      child: Icon(icon),
    );
  }
}
