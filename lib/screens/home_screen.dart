import 'package:flutter/material.dart';

import '../widgets/custom_nav_bar.dart';
import '../widgets/difficulty_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Flashcards',
                      style: TextStyle(
                        fontSize: 29,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Pick your theme',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 17),
                    ),
                  ],
                ),
              ),
              DiffWidget(
                color: Theme.of(context).colorScheme.secondary,
                difficulty: 'beginner',
                title: 'Letters',
                body: 'Start your adventure',
              ),
              const SizedBox(height: 10),
              DiffWidget(
                color: Theme.of(context).colorScheme.tertiary,
                difficulty: 'intermediate',
                title: 'Starting words',
                body: 'Build your adventure',
              ),
              const SizedBox(height: 10),
              DiffWidget(
                color: Theme.of(context).colorScheme.secondaryContainer,
                difficulty: 'advanced',
                title: 'Sentances',
                body: 'Complete your adventure',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const customBottomNav(),
    );
  }

  // Container customBottomNav(BuildContext context) {
  //   return Container(
  //     height: 85,
  //     //add ClipRRect widget for Round Corner
  //     child: ClipRRect(
  //       borderRadius: const BorderRadius.only(
  //         topRight: Radius.circular(32),
  //         topLeft: Radius.circular(32),
  //       ),
  //       child: BottomNavigationBar(
  //         //add background color
  //         backgroundColor: Theme.of(context).colorScheme.primaryContainer,
  //         items: <BottomNavigationBarItem>[
  //           BottomNavigationBarItem(
  //             icon: Container(
  //                 height: 55,
  //                 color: _selectedIndex == 0
  //                     ? Theme.of(context).colorScheme.tertiaryContainer
  //                     : Colors.transparent,
  //                 child: const Icon(Icons.home)),
  //             label: '',
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Container(
  //                 height: 77,
  //                 color: _selectedIndex == 1
  //                     ? Theme.of(context).colorScheme.tertiaryContainer
  //                     : Colors.transparent,
  //                 child: const Icon(Icons.business)),
  //             label: '',
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Container(
  //                 height: 77,
  //                 color: _selectedIndex == 2
  //                     ? Theme.of(context).colorScheme.tertiaryContainer
  //                     : Colors.transparent,
  //                 child: const Icon(Icons.school)),
  //             label: '',
  //           ),
  //         ],
  //         currentIndex: _selectedIndex,
  //         selectedItemColor: Colors.white,
  //         onTap: _onItemTapped,
  //       ),
  //     ),
  //   );
  // }
}
