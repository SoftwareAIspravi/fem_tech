class ForumTopic {
  final String id;
  final String title;
  final String description;
  final String authorName;
  final DateTime createdAt;
  final int messageCount;
  final DateTime lastActivity;

  const ForumTopic({
    required this.id,
    required this.title,
    required this.description,
    required this.authorName,
    required this.createdAt,
    required this.messageCount,
    required this.lastActivity,
  });
}
