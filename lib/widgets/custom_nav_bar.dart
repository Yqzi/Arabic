import 'package:flutter/material.dart';
import 'package:language_learning/global.dart';
import 'package:language_learning/screens/flashcards_screen.dart';
import 'package:language_learning/screens/home_screen.dart';

class CustomBottomNav extends StatelessWidget {
  final int index;
  const CustomBottomNav({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(33),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _Button(index: index, selfIndex: 0, icon: Icons.gamepad),
          _Button(index: index, selfIndex: 1, icon: Icons.menu_book),
          _Button(index: index, selfIndex: 2, icon: Icons.person),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    super.key,
    required this.index,
    required this.selfIndex,
    required this.icon,
  });

  final int index;
  final int selfIndex;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: index == selfIndex
          ? Theme.of(context).colorScheme.tertiaryContainer
          : Colors.transparent,
      borderRadius: BorderRadius.circular(33),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(33),
          boxShadow: index == selfIndex
              ? const [
                  BoxShadow(
                      color: Color.fromARGB(200, 0, 0, 0),
                      blurRadius: 7,
                      offset: Offset(0, 7))
                ]
              : null,
        ),
        height: 77,
        width: MediaQuery.of(context).size.width / 3.5,
        child: IconButton(
            onPressed: () {
              // access stream and push an event
              HomeScreenState.of(context)!
                  .bottomNavEventController
                  .add(selfIndex);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return selfIndex == 0
                    ? const HomeScreen()
                    : selfIndex == 1
                        ? const FlashCardScreen()
                        : const HomeScreen();
              }));
            },
            icon: Opacity(
              opacity: index == selfIndex ? 1 : 0.6,
              child: Icon(
                icon,
                size: 55,
              ),
            )),
      ),
    );
  }
}
