import 'package:flutter/material.dart';
import 'package:stacked_animated_list/utils/animated_stack_list_mixin.dart';
import 'package:stacked_animated_list/utils/item_position_type.dart';

class FocusedTransformedItemWidget extends StatelessWidget
    with AnimatedStackListMixin {
  final Widget child;
  final Animation animation;
  final double rotationAngle;
  final double horizontalOffset;
  final ItemPositionType positionType;

  const FocusedTransformedItemWidget({
    required this.child,
    required this.animation,
    required this.rotationAngle,
    required this.horizontalOffset,
    required this.positionType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final multiplier = (positionType == ItemPositionType.left ? 1 : -1);

    return Transform.rotate(
      angle: multiplier *
          getRotationAngleInRadiansForFocusedItem(
            rotationAngle,
            animation,
          ),
      child: Transform.translate(
        offset: getOffsetForFocusedItem(
          horizontalOffset,
          animation,
          multiplier,
        ),
        child: child,
      ),
    );
  }
}
