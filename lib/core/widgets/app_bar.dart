import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme/app_theme.dart';
import '../theme/theme_cubit.dart';
import 'app_Image.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.title, this.haveAction = true, this.haveDrawer, this.backgroundColor});

  final Color? backgroundColor;
  final bool haveAction;
  final String? title;
  final bool? haveDrawer;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final theme = Theme.of(context);
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        final brightness = MediaQuery.of(context).platformBrightness;
        final isDark = themeMode == ThemeMode.dark || (themeMode == ThemeMode.system && brightness == Brightness.dark);

        return AppBar(
          backgroundColor:  Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Open",
                style: TextStyle(
                  fontFamily: "Epilogue",
                  fontSize: 30,
                  color: color.onSurface,
                  fontVariations: [FontVariation("wght", 300)],
                ),
              ),
              AppImage(image: "app_logo.png", width: 50),
            ],
          ),
          actionsPadding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
          actions: [
            IconButton(onPressed: () => context.read<ThemeCubit>().toggleTheme(), icon: Icon(Icons.color_lens)),
            PopupMenuTheme(
              data: PopupMenuThemeData(
                color: theme.scaffoldBackgroundColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 5,
                position: PopupMenuPosition.under,
              ),
              child: PopupMenuButton(
                splashRadius: 16,

                itemBuilder: (BuildContext context) {
                  return [];
                },
                child: AppImage(image: "Menu.svg", svgColorFilter: ColorFilter.mode(color.onSurface, BlendMode.srcIn)),
              ),
            ),
          ],
        );
      },
    );
  }
}
