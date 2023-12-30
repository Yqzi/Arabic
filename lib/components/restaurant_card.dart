import 'package:famous_restaurant/services/database.dart';
import 'package:flutter/material.dart';

import '../models/restaurant.dart';

class SocialPictureGroup extends StatelessWidget {
  const SocialPictureGroup({
    super.key,
    required this.res,
    this.isFav = false,
    this.width = 400,
  });

  final Res res;
  final bool isFav;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(22)),
                      // color: Colors.red
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      res.imgUrl,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      res.title,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Container(
                width: width,
                child: LikeListTile(
                  title: "Andre Hirata",
                  likes: "130",
                  subtitle: "103 Reviews",
                  color: Colors.white,
                  res: res,
                  isFav: isFav,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LikeListTile extends StatelessWidget {
  const LikeListTile(
      {super.key,
      required this.res,
      required this.title,
      required this.likes,
      required this.subtitle,
      required this.isFav,
      this.color = Colors.grey});
  final String title;
  final String likes;
  final String subtitle;
  final Color color;
  final bool isFav;
  final Res res;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Container(
        width: 50,
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://profilemagazine.com/wp-content/uploads/2020/04/Ajmere-Dale-Square-thumbnail.jpg"))),
          ),
        ),
      ),
      title: Text(title),
      subtitle: Row(
        children: [
          const Icon(Icons.favorite, color: Colors.orange, size: 15),
          const SizedBox(width: 2),
          Text(likes),
          Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(width: 4, height: 4),
              )),
          Text(subtitle)
        ],
      ),
      trailing: LikeButton(
        color: Colors.orange,
        res: res,
        isFav: isFav,
      ),
    );
  }
}

class LikeButton extends StatefulWidget {
  const LikeButton({
    super.key,
    this.color = Colors.black12,
    required this.res,
    required this.isFav,
  });
  final Color color;
  final bool isFav;
  final Res res;
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  late bool isLiked = widget.isFav;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: IconButton(
      icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border,
          color: widget.color),
      onPressed: () async {
        isLiked = !isLiked;
        if (isLiked) {
          await DatabaseService.updateFavourites(widget.res);
        } else {
          await DatabaseService.deleteFavourite(widget.res.title);
        }
        setState(() {});
      },
    ));
  }
}
