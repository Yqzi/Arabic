import 'dart:async';

import 'package:flutter/material.dart';
import 'package:language_learning/widgets/custom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

int pageIndex = 0;

class HomeScreenState extends State<HomeScreen> {
  final bottomNavEventController = StreamController<int>();

  void changePage(int index) => setState(() => pageIndex = index);

  static HomeScreenState? of(BuildContext context) =>
      context.findAncestorStateOfType<HomeScreenState>();

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
      body: ListView(
        children: [
          Stack(),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(index: pageIndex),
    );
  }
}
