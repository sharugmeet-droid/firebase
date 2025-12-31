class Task {
  String id;
  String title;
  bool isDone;

  Task({required this.id, required this.title, required this.isDone});

  Map<String, dynamic> toMap() => {'title': title, 'isDone': isDone};
}
