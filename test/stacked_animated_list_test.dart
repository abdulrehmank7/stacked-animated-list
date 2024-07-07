import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mixin_test_helper.dart';

void main() {
  late AnimatedMixinTestHelper mockClass;
  setUp(() {
    mockClass = AnimatedMixinTestHelper();
  });

  test('is flicked', () {
    expect(
      true,
      mockClass.isItemFlicked(
        DraggableDetails(
          velocity: const Velocity(pixelsPerSecond: Offset(501, 0)),
          offset: const Offset(0, 0),
        ),
      ),
    );
    expect(
      false,
      mockClass.isItemFlicked(
        DraggableDetails(
          velocity: const Velocity(pixelsPerSecond: Offset(499, 0)),
          offset: const Offset(0, 0),
        ),
      ),
    );
    expect(
      true,
      mockClass.isItemFlicked(
        DraggableDetails(
          velocity: const Velocity(pixelsPerSecond: Offset(0, 501)),
          offset: const Offset(0, 0),
        ),
      ),
    );
    expect(
      false,
      mockClass.isItemFlicked(
        DraggableDetails(
          velocity: const Velocity(pixelsPerSecond: Offset(0, 0)),
          offset: const Offset(0, 0),
        ),
      ),
    );
    expect(
      false,
      mockClass.isItemFlicked(
        DraggableDetails(
          velocity: const Velocity(pixelsPerSecond: Offset(10, 10)),
          offset: const Offset(0, 0),
        ),
      ),
    );
    expect(
      true,
      mockClass.isItemFlicked(
        DraggableDetails(
          velocity: const Velocity(pixelsPerSecond: Offset(501, 501)),
          offset: const Offset(0, 0),
        ),
      ),
    );
  });
}
