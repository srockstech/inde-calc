import 'package:flutter/material.dart';

// const kInactiveCardColour = Color(0xFF1E1D33);
const kInactiveCardColour = Color(0xFF690E28);
// const kActiveCardColour = Color(0xFF111328);
const kActiveCardColour = Color(0xFF590E28);
// const kCalculateButtonColour = Color(0xFFEB1555);
const kCalculateButtonColour = Color(0xFFFF9100);
const kSliderActiveColour = Colors.white;
const kSliderInactiveColour = Color(0xFF8D8E98);
const kSliderMinValue = 0.0;
const kSliderMaxValue = 50.0;
// const kSliderThumbColour = Color(0xFFEB1555);
const kSliderThumbColour = Color(0xFFFF9100);
const kSliderThumbRadius = 15.0;
const kSliderThumbOverlayRadius = 25.0;
const kSliderThumbOverlayColour = Color(0x1FFF9100);
const kSliderTrackHeight = 2.0;
const kRoundedIconButtonColor = Color(0xFF522738);

const kTitleStyle = TextStyle(
  height: 1.0,
  fontSize: 15,
  fontWeight: FontWeight.w700,
  color: Color(0xFF999999),
  letterSpacing: 1,
);

const kNumberStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w900,
  letterSpacing: 2,
);

const kResultNumberTextStyle = TextStyle(
  fontSize: 80,
  fontWeight: FontWeight.w900,
);

const kResultDescriptionStyle = TextStyle(
  fontSize: 20,
  height: 1.7,
);

enum StructureType { frame, truss, none }

enum Dimensions { two, three }
