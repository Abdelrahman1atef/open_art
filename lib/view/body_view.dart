import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_art/core/theme/app_theme.dart';
import 'package:open_art/core/theme/theme_cubit.dart';
import 'package:open_art/core/widgets/app_Image.dart';
import 'package:open_art/core/widgets/app_bar.dart';
import 'package:open_art/core/widgets/app_button.dart';
import 'package:open_art/core/widgets/app_footer.dart';

class BodyView extends StatelessWidget {
  const BodyView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(children: [child, SizedBox(height: 40), AppFooter()]),
      ),
    );
  }
}
