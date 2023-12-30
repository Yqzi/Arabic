import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:famous_restaurant/global.dart';

import '../models/restaurant.dart';

class DatabaseService {
  static FirebaseFirestore get db => FirebaseFirestore.instance;
  static final favs = db.collection('favourites');

  static Future updateFavourites(Res res) async {
    resL.add(res.title);
    return await favs.add(res.toJson());
  }

  static Future<List<Res>> getfavourites() async {
    return (await favs.get()).docs.map((e) => Res.fromJson(e.data())).toList();
  }

  static Future<void> deleteFavourite(String title) async {
    resL.remove(title);
    final uid =
        (await favs.where("title", isEqualTo: title).get()).docs.first.id;

    favs.doc(uid).delete();
  }
}
