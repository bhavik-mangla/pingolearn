//calculates the time ago from the given date

String timeAgo(String date) {
  final DateTime dateTime = DateTime.parse(date);
  final Duration diff = DateTime.now().difference(dateTime);
  if (diff.inDays > 365) {
    return '${(diff.inDays / 365).floor()} years ago';
  } else if (diff.inDays > 30) {
    return '${(diff.inDays / 30).floor()} months ago';
  } else if (diff.inDays > 7) {
    return '${(diff.inDays / 7).floor()} weeks ago';
  }
  else if (diff.inDays == 1) {
    return 'Yesterday';
  }
  else if (diff.inDays > 1) {
    return '${diff.inDays} days ago';
  } else if (diff.inHours > 0) {
    return '${diff.inHours} hours ago';
  } else if (diff.inMinutes > 0) {
    return '${diff.inMinutes} min ago';
  } else {
    return 'Just now';
  }
}