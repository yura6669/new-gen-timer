import 'package:flutter/material.dart';
import 'package:timer/resources/app_colors.dart';

double adaptiveHeight(BuildContext context, double percent) {
  return (MediaQuery.of(context).size.height / 100) * percent;
}

double adaptiveWidth(BuildContext context, double percent) {
  return (MediaQuery.of(context).size.width / 100) * percent;
}

TextStyle customTextStyle(
  BuildContext context, {
  Color color = AppColors.white,
  double size = 3,
  FontWeight fontWeight = FontWeight.w400,
  TextDecoration? decoration = TextDecoration.none,
  String fontFamily = 'Lato',
}) {
  return TextStyle(
    color: color,
    fontFamily: fontFamily,
    fontSize: adaptiveWidth(context, size),
    fontWeight: fontWeight,
    decoration: decoration,
    decorationColor: color,
  );
}
