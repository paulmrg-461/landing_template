import 'package:landing_template/presentation/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final Color color;
  final ScreenSizes screenSize;
  const HomeView({super.key, required this.color, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    double opacity = 1;
    if (screenSize == ScreenSizes.medium) {
      opacity = 0.7;
    }
    if (screenSize == ScreenSizes.small) {
      opacity = 0.4;
    }
    return Container(
      color: color.withOpacity(opacity),
    );
  }
}
