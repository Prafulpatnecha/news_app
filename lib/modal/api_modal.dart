
class ApiModal {
  late dynamic status;
  late int totalResults;
  late List<Articles> articles;

  ApiModal({required this.status,required this.totalResults,required this.articles});
  factory ApiModal.fromJson(Map m1)
  {
    return ApiModal(status: m1['status'], totalResults: m1['totalResults'], articles: (m1['articles'] as List).map((e) => Articles.fromJson(e),).toList());
  }
}

class Articles{
  late dynamic author,title,description,url,urlToImage,publishedAt,content;
  late Source source;

  Articles(
      {required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content,
      required this.source});

  factory Articles.fromJson(Map m1)
  {
    return Articles(author: m1['author'], title: m1['title'], description: m1['description'], url: m1['url'], urlToImage: m1['urlToImage'], publishedAt: m1['publishedAt'], content: m1['content'], source: Source.fromJson(m1['source']));
  }
}
class Source{
  late dynamic id,name;
  Source({required this.id,required this.name});
  factory Source.fromJson(Map m1)
  {
    return Source(id: m1['id'], name: m1['name']);
  }
}