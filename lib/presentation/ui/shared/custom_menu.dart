import 'package:landing_template/config/themes/custom_theme.dart';
import 'package:landing_template/presentation/providers/page_provider.dart';
import 'package:landing_template/presentation/ui/screens/home_screen.dart';
import 'package:landing_template/presentation/ui/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomMenu extends StatefulWidget {
  final ScreenSizes screenSize;
  const CustomMenu({Key? key, required this.screenSize}) : super(key: key);

  @override
  State<CustomMenu> createState() => _CustomMenuState();
}

class _CustomMenuState extends State<CustomMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PageProvider pageProvider =
        Provider.of<PageProvider>(context, listen: false);

    return Container(
        width: size.width,
        color: CustomTheme.backgroundColor,
        child: (widget.screenSize == ScreenSizes.large)
            ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.11, vertical: 10),
                child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Landing template',
                      ),
                      const Spacer(),
                      ...List.generate(
                        pageProvider.pages.length,
                        (index) => CustomMenuItem(
                          text: pageProvider.pages[index],
                          onPressed: () => pageProvider.goTo(index),
                          delay: (index + 1) * 50,
                        ),
                      ),
                    ]),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                child: InkWell(
                  mouseCursor: SystemMouseCursors.click,
                  onTap: () => setState(() {
                    isOpen ? controller.reverse() : controller.forward();
                    isOpen = !isOpen;
                  }),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _MenuTitle(isOpen: isOpen, controller: controller),
                      if (isOpen) ...[
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: Divider(
                            thickness: 0.5,
                          ),
                        ),
                        ...List.generate(
                          pageProvider.pages.length,
                          (index) => CustomMenuItem(
                            text: pageProvider.pages[index],
                            onPressed: () => pageProvider.goTo(index),
                            delay: (index + 1) * 50,
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
              ));
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required this.controller,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          width: isOpen ? 40 : 0,
        ),
        const Text(
          'Landing template',
        ),
        const Spacer(),
        AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: controller,
        ),
      ],
    );
  }
}
