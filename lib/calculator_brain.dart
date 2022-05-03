import 'dart:math';
import 'constants.dart';

class CalculatorBrain {
  int members;
  int joints;
  int externalReactions;
  int releasedReactions;
  StructureType structure;
  int _staticIndeterminacy;
  CalculatorBrain(
      {this.members,
      this.joints,
      this.externalReactions,
      this.releasedReactions,
      this.structure});

  String calculateStaticIndeterminacy() {
    if (structure == StructureType.frame) {
      _staticIndeterminacy =
          (3 * members + externalReactions) - (3 * joints + releasedReactions);
    } else if (structure == StructureType.truss) {
      _staticIndeterminacy = (members + externalReactions) - (2 * joints);
    } else {
      return 'No Structure Selected!';
    }
    return _staticIndeterminacy.toString();
  }

  String getResultKeyword() {
    if (_staticIndeterminacy == 0) {
      return 'DETERMINATE & STABLE';
    } else if (_staticIndeterminacy > 0) {
      return 'INDETERMINATE';
    } else {
      return 'UNSTABLE';
    }
  }
}
