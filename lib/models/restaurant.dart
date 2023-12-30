class Res {
  final String imgUrl;
  final String title;

  Res({required this.imgUrl, required this.title});

  factory Res.fromJson(Map<String, dynamic> m) {
    return Res(imgUrl: m['imgUrl'], title: m['title']);
  }

  Map<String, dynamic> toJson() => {'title': title, 'imgUrl': imgUrl};
}
