import 'package:flutter/material.dart';

class DiffWidget extends StatelessWidget {
  final String difficulty;
  final String title;
  final String body;
  final Color color;
  const DiffWidget({
    super.key,
    required this.difficulty,
    required this.title,
    required this.body,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: color,
          elevation: 0,
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    difficulty,
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.error),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                        body,
                        textAlign: TextAlign.start,
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  const Text('implement proress bar')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
