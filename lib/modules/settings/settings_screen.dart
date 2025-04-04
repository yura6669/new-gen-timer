import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:timer/modules/settings/widgets/img_btn.dart';
import 'package:timer/resources/resorces.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: adaptiveWidth(context, 10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: adaptiveHeight(context, 2.1)),
            _buildChooseLanguageTitle(context),
            SizedBox(height: adaptiveHeight(context, 2.1)),
            Row(
              children: [
                ImgBtn(
                  imgPath: 'assets/img/english.png',
                  onTap: () {
                    context.setLocale(const Locale('en', 'US'));
                  },
                ),
                SizedBox(width: adaptiveWidth(context, 5)),
                ImgBtn(
                  imgPath: 'assets/img/ukraine.png',
                  onTap: () {
                    context.setLocale(const Locale('uk', 'UA'));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChooseLanguageTitle(BuildContext context) {
    return Text(
      context.tr('setting-language'),
      style: customTextStyle(context, size: 5.5),
    );
  }
}
