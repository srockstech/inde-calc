import 'dart:math';
import 'constants.dart';

class CalculatorBrain {
  int members;
  int joints;
  int externalReactions;
  int releasedReactions;
  Dimensions dimension;
  StructureType structure;
  int _staticIndeterminacy;
  CalculatorBrain(
      {this.members,
      this.joints,
      this.externalReactions,
      this.releasedReactions,
      this.structure,
      this.dimension});

  String calculateStaticIndeterminacy() {
    if (dimension == Dimensions.two) {
      if (structure == StructureType.frame) {
        _staticIndeterminacy = (3 * members + externalReactions) -
            (3 * joints + releasedReactions);
      } else if (structure == StructureType.truss) {
        _staticIndeterminacy = (members + externalReactions) - (2 * joints);
      }
    } else if (dimension == Dimensions.three) {
      if (structure == StructureType.frame) {
        _staticIndeterminacy = (6 * members + externalReactions) -
            (6 * joints + releasedReactions);
      } else if (structure == StructureType.truss) {
        _staticIndeterminacy = (members + externalReactions) - (3 * joints);
      }
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
