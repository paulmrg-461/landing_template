import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:landing_template/presentation/providers/page_provider.dart';
import 'package:landing_template/presentation/ui/screens/home_screen.dart';

final homeHandler = Handler(handlerFunc: (context, parameters) {
  final page = parameters['page']!.first;
  final PageProvider pageProvider =
      Provider.of<PageProvider>(context!, listen: false);
  if (page != '/') {
    pageProvider.createScrollController(page);
    return const HomeScreen();
  }
});
