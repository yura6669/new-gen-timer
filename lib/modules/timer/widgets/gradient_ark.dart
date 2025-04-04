import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:timer/resources/app_colors.dart';

class GradientArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 1.75;
    final Offset center = Offset(size.width / 2, size.height);
    final Rect rect = Rect.fromCircle(center: center, radius: radius);

    final Paint gradientPaint =
        Paint()
          ..shader = LinearGradient(
            colors: [AppColors.arcRed, AppColors.arcYellow],
          ).createShader(rect)
          ..style = PaintingStyle.stroke;

    Path path = Path();
    path.addArc(rect, pi, pi);

    PathMetric pathMetric = path.computeMetrics().first;

    Path newPath = Path();
    for (double i = 0; i < pathMetric.length; i += 0.01) {
      Tangent? tangent = pathMetric.getTangentForOffset(i);
      if (tangent != null) {
        double progress = i / pathMetric.length;
        double thickness = 15 * (1 - (progress - 0.5).abs() * 2);

        newPath.addOval(
          Rect.fromCircle(center: tangent.position, radius: thickness / 4),
        );
      }
    }

    canvas.drawPath(newPath, gradientPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
