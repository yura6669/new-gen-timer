import 'dart:math';

import 'package:flutter/material.dart';
import 'package:timer/resources/app_colors.dart';

class SquaresBorderPainter extends CustomPainter {
  final int currentSecond;
  SquaresBorderPainter({required this.currentSecond});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = AppColors.white
          ..style = PaintingStyle.fill;

    final double radius = size.width / 2;
    final double squareSize = 1.57;

    for (int i = 0; i < 60; i++) {
      final double angle = (i * 2 * pi) / 60;
      final double x = radius + radius * 0.85 * cos(angle);
      final double y = radius + radius * 0.85 * sin(angle);

      final Rect squareRect = Rect.fromLTWH(
        x - squareSize / 2,
        y - squareSize / 2,
        i == currentSecond ? squareSize + 3 : squareSize,
        i == currentSecond ? squareSize + 3 : squareSize,
      );

      canvas.drawRect(squareRect, paint..color = AppColors.white);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
