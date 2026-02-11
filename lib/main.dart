import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_art/view/home/view.dart';
import 'package:open_art/view/body_view.dart';

import 'core/logic/helper_methods.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_cubit.dart';


void main() {
  runApp(const OpenArt());
}

class OpenArt extends StatefulWidget {
  const OpenArt({super.key});

  @override
  State<OpenArt> createState() => _OpenArtState();
}

class _OpenArtState extends State<OpenArt> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navKey,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
            home: BodyView(child: HomeView()),
          );
        },
      ),
    );
  }
}



