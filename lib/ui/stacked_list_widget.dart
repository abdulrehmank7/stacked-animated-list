library stacked_animated_list;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:stacked_animated_list/models/stacked_item.dart';
import 'package:stacked_animated_list/ui/transformed_list_item_widget.dart';
import 'package:stacked_animated_list/utils/animated_stack_list_mixin.dart';

class StackedListWidget extends StatefulWidget {
  final List<Widget> listItems;
  final Duration animationDuration;
  final double listItemWidth;
  final BorderRadiusGeometry? borderRadius;

  const StackedListWidget({
    required this.listItems,
    required this.listItemWidth,
    this.animationDuration = const Duration(milliseconds: 350),
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    super.key,
  });

  @override
  State<StackedListWidget> createState() => _StackedListWidgetState();
}

class _StackedListWidgetState extends State<StackedListWidget>
    with SingleTickerProviderStateMixin, AnimatedStackListMixin {
  final List<StackedItem> _stackWidgets = [];
  AnimationController? _animationCtr;
  Animation? _increaseAnim;

  @override
  void initState() {
    _animationCtr = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _increaseAnim = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _animationCtr!, curve: Curves.easeOut));

    _stackWidgets.clear();
    _stackWidgets.addAll(generateStackedItems(widget.listItems));
    _animationCtr?.forward(from: 0);

    super.initState();
  }

  @override
  void dispose() {
    _animationCtr?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: _stackWidgets
          .mapIndexed(
            (index, item) {
              final isFirstItem = index == 0;

              return Center(
                child: TransformedListItemWidget(
                  stackedItem: item,
                  animation: _increaseAnim!,
                  widgetWidth: widget.listItemWidth,
                  focusedWidget: isFirstItem,
                  borderRadius: widget.borderRadius,
                  onDragEnded: () {
                    final refreshList = refreshedStackedItems(_stackWidgets);
                    _stackWidgets.clear();
                    _stackWidgets.addAll(refreshList);
                    _animationCtr?.forward(from: 0);
                    setState(() {});
                  },
                ),
              );
            },
          )
          .toList()
          .reversed
          .toList(),
    );
  }
}
