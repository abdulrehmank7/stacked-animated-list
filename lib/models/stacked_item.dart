import 'package:flutter/material.dart';
import 'package:stacked_animated_list/utils/item_position_type.dart';

class StackedItem {
  final Widget widget;
  ItemPositionType positionType;
  ItemPositionType positionTypeForNextItem;
  final int baseIndex;

  StackedItem({
    required this.widget,
    required this.positionType,
    required this.positionTypeForNextItem,
    required this.baseIndex,
  });
}
