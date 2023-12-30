import 'package:famous_restaurant/components/restaurant_card.dart';
import 'package:famous_restaurant/services/database.dart';
import 'package:flutter/material.dart';

import '../models/restaurant.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: Stack(
        children: [
          Image.network(
            'https://www.state.gov/wp-content/uploads/2023/07/shutterstock_433413835v2.jpg',
            width: double.infinity,
            height: 500,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            height: 500,
            decoration: const BoxDecoration(
              color: Color(0x8D090F13),
            ),
          ),
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                centerTitle: true,
                iconTheme:
                    Theme.of(context).iconTheme.copyWith(color: Colors.white),
                title: const Text(
                  'FAVOURITES',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 150),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: FutureBuilder<List<Res>>(
                    future: DatabaseService.getfavourites(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return SizedBox(
                          height: 10,
                          child: const CircularProgressIndicator(),
                        );
                      }
                      return ListView(
                        children: snapshot.data!
                            .map((r) => SocialPictureGroup(
                                  res: r,
                                  isFav: true,
                                ))
                            .toList(),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
