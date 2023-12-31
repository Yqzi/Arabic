import 'package:famous_restaurant/global.dart';
import 'package:flutter/material.dart';

class DiffWidget extends StatelessWidget {
  final String title;
  final Difficulty difficulty;
  final String body;
  final LinearProgressIndicator progressbar;
  const DiffWidget({
    super.key,
    required this.difficulty,
    required this.title,
    required this.body,
    required this.progressbar,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$difficulty'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(body),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: progressbar,
            ),
          ],
        ),
      ),
    );
  }
}
