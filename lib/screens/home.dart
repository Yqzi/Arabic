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

  Widget getPage() {
    if (pageIndex == 0) {
      return const FlashCardScreen();
    }
    if (pageIndex == 1) {
      return const FlashCardScreen();
    }
    return const FlashCardScreen();
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
      body: getPage(),
      bottomNavigationBar: CustomBottomNav(index: pageIndex),
    );
  }
}
