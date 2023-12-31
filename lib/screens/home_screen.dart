import 'package:famous_restaurant/global.dart';
import 'package:famous_restaurant/widgets/difficulty_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                child: Icon(Icons.person),
              )
            ],
          ),
          Text(
            'Hello Person',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          DiffWidget(
            difficulty: Difficulty.beginner,
            title: 'Letters',
            body: 'Start your adventure',
            progressbar: LinearProgressIndicator(),
          ),
          DiffWidget(
            difficulty: Difficulty.intermediate,
            title: 'Starting words',
            body: 'Build your adventure',
            progressbar: LinearProgressIndicator(),
          ),
          DiffWidget(
            difficulty: Difficulty.advanced,
            title: 'Sentances',
            body: 'Complete your adventure',
            progressbar: LinearProgressIndicator(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}
