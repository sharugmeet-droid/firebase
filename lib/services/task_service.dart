import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TaskService {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final _db = FirebaseFirestore.instance;

  CollectionReference get tasks =>
      _db.collection('users').doc(uid).collection('tasks');

  Stream<QuerySnapshot> getTasks() => tasks.snapshots();

  Future<void> addTask(String title) async {
    await tasks.add({'title': title, 'isDone': false});
  }
}
