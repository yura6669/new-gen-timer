import 'package:flutter/material.dart';
import 'package:timer/resources/app_colors.dart';
import 'package:timer/resources/resorces.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isActive;
  const CustomBtn({
    required this.text,
    required this.onPressed,
    this.isActive = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: adaptiveHeight(context, 1.3)),
        width: adaptiveWidth(context, 80),
        decoration: BoxDecoration(
          color: isActive ? AppColors.btnActive : AppColors.btnDefault,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.12),
            width: 1.0,
          ),
          gradient:
              isActive
                  ? null
                  : LinearGradient(
                    colors: [
                      Colors.white.withValues(alpha: 0.1),
                      Colors.white.withValues(alpha: 0.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF375DFB),
              offset: const Offset(0, 0),
              blurRadius: 0,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Color(0xFF375DFB).withValues(alpha: 0.48),
              offset: const Offset(0, 1),
              blurRadius: 2,
            ),
          ],
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: customTextStyle(context, size: 5.6),
        ),
      ),
    );
  }
}
