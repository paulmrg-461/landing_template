import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:landing_template/config/core/helpers/custom_scroll_behavior.dart';
import 'package:landing_template/presentation/providers/page_provider.dart';
import 'package:landing_template/config/routes/app_routes.dart';
import 'package:landing_template/config/themes/custom_theme.dart';

void main() {
  Flurorouter.configureRoutes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PageProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Landing template',
        initialRoute: 'home',
        onGenerateRoute: Flurorouter.router.generator,
        scrollBehavior: CustomScrollBehavior(),
        theme: CustomTheme.dark,
      ),
    );
  }
}
