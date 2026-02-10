import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_art/core/theme/theme_cubit.dart';
import 'package:open_art/core/widgets/app_Image.dart';

import '../core/theme/app_theme.dart';
import '../core/widgets/app_bar.dart';
import '../core/widgets/app_button.dart';
import '../main.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: CustomAppBar(),

      body: Center(
        child: Placeholder(),
      ),
    );
  }
}
