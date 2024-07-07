enum ItemPositionType {
  left('left'),
  right('right'),
  center('center');

  final String value;

  const ItemPositionType(this.value);

  ItemPositionType get reverse {
    switch (this) {
      case center:
      case left:
        return right;
      case right:
        return left;
    }
  }
}
