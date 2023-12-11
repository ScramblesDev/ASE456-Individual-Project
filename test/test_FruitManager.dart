import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:ASE456-Individual-Project/FruitManager.dart';

void main() {
  group('FruitManager Tests', () {
    final fruitManager = FruitManager();

    test('Initial fruit should be tomato.png', () {
      expect(fruitManager.getCurrentImage(), 'assets/tomato.png');
    });

    test('Background color for tomato.png should be light Pink', () {
      expect(fruitManager.getBackgroundColor(),
          Color.fromRGBO(255, 182, 193, 0.3));
    });

    test('Should cycle through images correctly', () {
      int initialIndex = fruitManager.currentImageIndex;
      fruitManager.changeImage();
      expect(fruitManager.currentImageIndex,
          (initialIndex + 1) % fruitManager.images.length);
    });
  });
}
