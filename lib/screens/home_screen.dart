import 'package:famous_restaurant/components/restaurant_card.dart';
import 'package:famous_restaurant/models/restaurant.dart';
import 'package:famous_restaurant/screens/favourites_screen.dart';
import 'package:famous_restaurant/services/database.dart';
import 'package:flutter/material.dart';

import '../global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DatabaseService db = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(0.00, -1.10),
            child: Image.network(
              'https://www.state.gov/wp-content/uploads/2023/07/shutterstock_433413835v2.jpg',
              width: double.infinity,
              height: 500,
              fit: BoxFit.cover,
            ),
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
              Padding(
                padding: const EdgeInsets.only(
                  top: 48,
                  bottom: 16,
                  right: 8,
                  left: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Search Bar
                    Expanded(
                      child: TextFormField(
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'find restaurants',
                          hintStyle: const TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            color: Color(0xFF57636C),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xFF14181B),
                            size: 16,
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          color: Color(0xFF14181B),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    // Favorits tab
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const FavouritesScreen()));
                        },
                        icon: const Icon(Icons.star, color: Colors.amber),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 44),
                child: Text(
                  'Explore the taste of Italy in edmonton.',
                  style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: ListView(
                    children: [
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                        child: Text(
                          'Experience the Italian delights',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            color: Color(0xFF14181B),
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      const Divider(
                        height: 8,
                        thickness: 4,
                        indent: 140,
                        endIndent: 140,
                        color: Color(0xFFE0E3E7),
                      ),
                      for (Res res in lRES)
                        SocialPictureGroup(
                          res: res,
                          isFav: resL.contains(res.title),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
