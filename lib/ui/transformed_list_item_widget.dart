import 'package:flutter/material.dart';
import 'package:stacked_animated_list/models/stacked_item.dart';
import 'package:stacked_animated_list/ui/focused_transformed_item_widget.dart';
import 'package:stacked_animated_list/ui/unfocused_transformed_item_widget.dart';
import 'package:stacked_animated_list/utils/animated_stack_list_mixin.dart';
import 'package:stacked_animated_list/utils/item_position_type.dart';

class TransformedListItemWidget extends StatelessWidget
    with AnimatedStackListMixin {
  final StackedItem stackedItem;
  final double widgetWidth;
  final bool focusedWidget;
  final Function() onDragEnded;
  final Animation animation;
  final BorderRadiusGeometry? borderRadius;
  final double rotationAngle;
  final double additionalTranslateOffsetBeyondScreen;
  final List<BoxShadow>? focusedItemShadow;

  const TransformedListItemWidget({
    super.key,
    required this.stackedItem,
    required this.widgetWidth,
    required this.focusedWidget,
    required this.onDragEnded,
    required this.animation,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.rotationAngle = 15,
    this.additionalTranslateOffsetBeyondScreen = 0,
    this.focusedItemShadow,
  });

  @override
  Widget build(BuildContext context) {
    final horizontalOffset = getListItemHorizontalOffset(
      context,
      widgetWidth,
      additionalTranslateOffsetBeyondScreen,
    );

    if (focusedWidget) {
      final childWidget = Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          boxShadow: focusedItemShadow ?? defaultFocusedItemShadow(),
          borderRadius: borderRadius,
        ),
        child: stackedItem.widget,
      );

      final animatedFromPosType = stackedItem.positionTypeForNextItem.reverse;

      return AnimatedBuilder(
        animation: animation,
        child: LongPressDraggable(
          feedback: childWidget,
          childWhenDragging: const SizedBox.shrink(),
          delay: const Duration(milliseconds: 10),
          child: childWidget,
          onDragEnd: (details) {
            if (isItemFlicked(details)) onDragEnded();
          },
        ),
        builder: (_, child) {
          return FocusedTransformedItemWidget(
            animation: animation,
            rotationAngle: rotationAngle,
            horizontalOffset: horizontalOffset,
            positionType: animatedFromPosType,
            child: child!,
          );
        },
      );
    }

    return UnfocusedTransformedItemWidget(
      stackedItem: stackedItem,
      animation: animation,
      rotationAngle: rotationAngle,
      horizontalOffset: horizontalOffset,
      borderRadius: borderRadius,
      positionType: stackedItem.positionType,
    );
  }
}
