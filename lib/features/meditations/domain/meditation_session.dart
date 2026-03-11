class MeditationSession {
  const MeditationSession({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.durationMinutes,
    required this.imageUrl,
    required this.isLocked,
    required this.tag,
  });

  final String id;
  final String title;
  final String subtitle;
  final int durationMinutes;
  final String imageUrl;
  final bool isLocked;
  final String tag;
}

