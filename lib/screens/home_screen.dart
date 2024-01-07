import 'dart:async';

import 'package:flutter/material.dart';
import 'package:language_learning/screens/flashcards_screen.dart';
import 'package:language_learning/widgets/custom_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  final bottomNavEventController = StreamController<int>();
  int pageIndex = 0;

  void changePage(int index) => setState(() => pageIndex = index);

  static HomeState? of(BuildContext context) =>
      context.findAncestorStateOfType<HomeState>();

  Widget getPage(int index) {
    if (index == 0) {
      return FlashCardScreen();
    }
    if (index == 1) {
      return FlashCardScreen();
    }
    return FlashCardScreen();
  }

  @override
  void initState() {
    bottomNavEventController.stream.listen(changePage);
    super.initState();
  }

  @override
  void dispose() {
    bottomNavEventController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: getPage(pageIndex),
      bottomNavigationBar: CustomBottomNav(index: pageIndex),
    );
  }
}
