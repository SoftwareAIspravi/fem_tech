class Event {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String location;
  final String organizerName;
  final String imageUrl;
  final bool isOnline;
  final int participantsCount;

  const Event({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.location,
    required this.organizerName,
    required this.imageUrl,
    required this.isOnline,
    required this.participantsCount,
  });
}
