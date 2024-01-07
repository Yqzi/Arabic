import 'package:flutter/material.dart';

import '../widgets/difficulty_widget.dart';

class FlashCardScreen extends StatefulWidget {
  const FlashCardScreen({super.key});

  @override
  FlashCardScreenState createState() => FlashCardScreenState();
}

class FlashCardScreenState extends State<FlashCardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              color2: Theme.of(context).colorScheme.secondaryContainer,
              difficulty: 'beginner',
              title: 'Letters',
              body: 'Start your adventure',
            ),
            const SizedBox(height: 10),
            DiffWidget(
              color: Theme.of(context).colorScheme.tertiary,
              color2: Theme.of(context).colorScheme.tertiary,
              difficulty: 'intermediate',
              title: 'Starting words',
              body: 'Build your adventure',
            ),
            const SizedBox(height: 10),
            DiffWidget(
              color: Theme.of(context).colorScheme.secondaryContainer,
              color2: Theme.of(context).colorScheme.secondary,
              difficulty: 'advanced',
              title: 'Sentances',
              body: 'Complete your adventure',
            ),
          ],
        ),
      ),
    );
  }
}
