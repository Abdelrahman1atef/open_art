import 'package:flutter/material.dart';
import 'package:open_art/core/theme/app_theme.dart';
import 'package:open_art/core/widgets/app_Image.dart';
import 'package:open_art/core/widgets/app_button.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final color = theme.colorScheme;
    return Column(
      children: [
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Open",
              style: TextStyle(
                fontFamily: "Epilogue",
                fontSize: 50,
                color: color.onSurface,
                fontVariations: [FontVariation("wght", 300)],
              ),
            ),
            AppImage(image: "app_logo.png", width: 90),
          ],
        ),
        SizedBox(height: 5),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "The",
                style: textTheme.displaySmall?.copyWith(fontSize: 25, fontVariations: [FontVariation("wght", 200)]),
              ),
              TextSpan(
                text: " New",
                style: textTheme.displaySmall?.copyWith(fontSize: 25, fontVariations: [FontVariation("wght", 300)]),
              ),
              TextSpan(
                text: " Creative",
                style: textTheme.displaySmall?.copyWith(fontSize: 25, fontVariations: [FontVariation("wght", 500)]),
              ),
              TextSpan(
                text: " Economy",
                style: textTheme.displaySmall?.copyWith(fontSize: 25, fontVariations: [FontVariation("wght", 700)]),
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        AppButton(type: AppButtonType.primary, isExpanded: true, text: "Earn now"),
        AppButton(
          type: AppButtonType.secondary,
          isExpanded: true,
          text: "Discover more",
          useWhiteText: false,
          disableGradient: true,
        ),
        Container(
          constraints: BoxConstraints(minHeight: 310),
          color: color.surfaceContainer,
          padding: EdgeInsetsDirectional.symmetric(vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: socialMedia.map((e) => _text(context,e)).toList()),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: pages.map((e) => _text(context,e)).toList()),
                ],
              ),
              Divider(indent: 0,endIndent: 0,height: 50,),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 20),
                child: Text("© 2021 Openart",style: textTheme.bodyMedium?.copyWith(color: AppGrayscale.background)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
Widget _text(context,String text){
  final theme = Theme.of(context);
  final textTheme = theme.textTheme;
  return Padding(
    padding: const EdgeInsetsDirectional.only(bottom: 10),
    child: Text(text,style: textTheme.bodyMedium?.copyWith(color: AppGrayscale.background),),
  );
}

final socialMedia = ["Instagram", "Twitter", "Discord", "Blog"];
final pages = ["About", "Community Guidelines", "Terms of Service", "Privacy", "Careers", "Help"];
