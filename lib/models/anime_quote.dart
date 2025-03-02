
class AnimeQuote {
  final String content;
  final String anime;
  final String character;

  AnimeQuote({
    required this.content,
    required this.anime,
    required this.character,
  });

  factory AnimeQuote.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return AnimeQuote(
      content: data['content'],
      anime: data['anime']['name'],
      character: data['character']['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'anime': anime,
      'character': character,
    };
  }
}