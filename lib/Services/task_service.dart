import 'package:aha_project_management/Model/Task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskService {
  static Future<List<TaskModel>> getTasksForUser(String userId) async {
    List<TaskModel> userTasks = [];
    return userTasks;
  }

   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = 'tasks';

  Future<void> addTask(TaskModel task) async {
    await _firestore.collection(_collectionName).doc(task.id).set(task.toMap());
  }

  Future<void> updateTask(TaskModel task) async {
    await _firestore.collection(_collectionName).doc(task.id).update(task.toMap());
  }

  Future<void> deleteTask(String taskId) async {
    await _firestore.collection(_collectionName).doc(taskId).delete();
  }

  Stream<List<TaskModel>> getTasks() {
    return _firestore.collection(_collectionName).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => TaskModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
    });
  }
}
