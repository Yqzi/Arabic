import 'package:flutter/material.dart';

class customBottomNav extends StatelessWidget {
  const customBottomNav({super.key});

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
          Material(
            borderRadius: BorderRadius.circular(33),
            elevation: 20,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(33),
                color: Theme.of(context).colorScheme.tertiaryContainer,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black, blurRadius: 7, offset: Offset(0, 7)),
                ],
              ),
              height: 77,
              width: 110,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.home,
                    size: 55,
                  )),
            ),
          ),
          Material(
            borderRadius: BorderRadius.circular(33),
            elevation: 20,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(33),
                color: Theme.of(context).colorScheme.tertiaryContainer,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black, blurRadius: 7, offset: Offset(0, 7)),
                ],
              ),
              height: 77,
              width: 110,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.school,
                    size: 55,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
