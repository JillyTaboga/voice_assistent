class ChatEntry {
  final DateTime createdTime;
  final ChatOrigem origin;
  final String content;
  const ChatEntry({
    required this.createdTime,
    required this.origin,
    required this.content,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatEntry &&
        other.createdTime == createdTime &&
        other.origin == origin &&
        other.content == content;
  }

  @override
  int get hashCode => createdTime.hashCode ^ origin.hashCode ^ content.hashCode;
}

enum ChatOrigem {
  user,
  assistent;
}
