import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);
  bool isDark = false;
  void toggleTheme() {
    isDark = !isDark;
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }
}
