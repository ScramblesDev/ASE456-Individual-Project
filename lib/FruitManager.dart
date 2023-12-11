import 'package:flutter/material.dart';

class FruitManager {
  final List<String> images = [
    'tomato.png',
    'pear.png',
    'apple.png',
    'lemon.png',
    'orange.png',
    'cucumber.png'
  ];
  int currentImageIndex = 0;

  String getCurrentImage() {
    return 'assets/${images[currentImageIndex]}';
  }

  Color getBackgroundColor() {
    switch (images[currentImageIndex]) {
      case 'tomato.png':
      case 'apple.png':
        return Color.fromRGBO(255, 182, 193, 0.3); // light pink
      case 'cucumber.png':
      case 'pear.png':
        return Color.fromRGBO(144, 238, 144, 0.3); // light green
      case 'lemon.png':
        return Color.fromRGBO(255, 247, 153, 0.3); // light yellow
      case 'orange.png':
        return Color.fromRGBO(255, 165, 0, 0.2); // light orange
      default:
        return Colors.white;
    }
  }

  void changeImage() {
    currentImageIndex = (currentImageIndex + 1) % images.length;
  }
}
