import 'package:flutter/material.dart';
import 'package:timer/resources/resorces.dart';

class ImgBtn extends StatelessWidget {
  final String imgPath;
  final VoidCallback onTap;
  const ImgBtn({required this.imgPath, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        imgPath,
        width: adaptiveWidth(context, 23.4),
        height: adaptiveWidth(context, 23.4),
      ),
    );
  }
}
