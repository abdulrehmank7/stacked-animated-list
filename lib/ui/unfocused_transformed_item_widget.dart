import 'package:flutter/material.dart';
import 'package:stacked_animated_list/models/stacked_item.dart';
import 'package:stacked_animated_list/utils/animated_stack_list_mixin.dart';
import 'package:stacked_animated_list/utils/item_position_type.dart';

class UnfocusedTransformedItemWidget extends StatelessWidget
    with AnimatedStackListMixin {
  final StackedItem stackedItem;
  final Animation animation;
  final double rotationAngle;
  final double horizontalOffset;
  final BorderRadiusGeometry? borderRadius;
  final ItemPositionType positionType;

  const UnfocusedTransformedItemWidget({
    required this.stackedItem,
    required this.animation,
    required this.rotationAngle,
    required this.horizontalOffset,
    this.borderRadius,
    required this.positionType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final multiplier = (positionType == ItemPositionType.left ? 1 : -1);

    return AnimatedBuilder(
      animation: animation,
      child: stackedItem.widget,
      builder: (_, child) {
        return Transform.rotate(
          angle:
              multiplier * getRotationAngleInRadians(rotationAngle, animation),
          child: Transform.translate(
            offset: getOffsetForUnfocusedItem(horizontalOffset, animation, multiplier),
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
              ),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(animation.value * 0.2),
                  BlendMode.srcOver,
                ),
                child: stackedItem.widget,
              ),
            ),
          ),
        );
      },
    );
  }
}
