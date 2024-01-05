import 'package:flutter/material.dart';

class DiffWidget extends StatelessWidget {
  final String difficulty;
  final String title;
  final String body;
  final Color color;
  final Color color2;

  const DiffWidget({
    super.key,
    required this.difficulty,
    required this.title,
    required this.body,
    required this.color,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: color,
                elevation: 0,
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        difficulty,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error),
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
            Padding(
              padding: const EdgeInsets.only(left: 27, right: 14),
              child: Column(
                children: [
                  Icon(
                    Icons.circle,
                    size: 40,
                    color: color2,
                  ),
                  Expanded(
                    child: Container(
                      color: color2,
                      width: 2,
                    ),
                  ),
                  // VerticalDivider(
                  //   width: 10,
                  //   thickness: 2,
                  //   color: Colors.white,
                  //   endIndent: 20,
                  //   indent: 20,
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
