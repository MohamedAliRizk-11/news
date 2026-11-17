class ArticleModel {
  final String? image;
  final String title;
  final String subTitle;
  final String? url;
  ArticleModel({
    required this.image,
    required this.subTitle,
    required this.title,
    required this.url,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      image: json['urlToImage'],
      subTitle: json['description'] ?? '',
      title: json['title'] ?? 'No title available',
      url: json['url'],
    );
  }
}
