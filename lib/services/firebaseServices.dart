//import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do/models/taskModel.dart';
import 'package:to_do/models/userData_model.dart';

class FirebaseServices {
  static CollectionReference<TaskModel> getTasksCollection() =>
      getUserCollection()
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("tasks")
          .withConverter(
            fromFirestore: (snapshot, options) =>
                TaskModel.fromJson(snapshot.data() ?? {}),
            toFirestore: (value, _) => value.toJson(),
          );
  static Future<void> addTask(TaskModel task) {
    CollectionReference<TaskModel> taskCollection = getTasksCollection();
    DocumentReference<TaskModel> documentReference = taskCollection.doc();
    task.id = documentReference.id;
    return documentReference.set(task);
  }

  static Future<void> deleteTask(String id) {
    CollectionReference<TaskModel> taskCollection = getTasksCollection();
    return taskCollection.doc(id).delete();
  }

  static Future<List<TaskModel>> getTasks() async {
    CollectionReference<TaskModel> taskCollection = getTasksCollection();
    QuerySnapshot<TaskModel> tasksQuery = await taskCollection.get();
    return tasksQuery.docs.map((e) => e.data()).toList();
  }

  // static deleteTask(String id)async{
  //  await FirebaseServices.deleteTask(id);
  // }
  static register(userData_model user, String password) async {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: user.email!, password: password);
    FirebaseAuth.instance.currentUser!.uid;
    credential.user?.uid;
    user.id = credential.user?.uid;
    await creatUser(user);
    return userData_model;
  }

  static CollectionReference<userData_model> getUserCollection() =>
      FirebaseFirestore.instance.collection("users").withConverter(
            fromFirestore: (snapshot, options) =>
                userData_model.fromJson(snapshot.data() ?? {}),
            toFirestore: (value, _) => value.toJson(),
          );

  static login(String email, String password) async {
    //UserCredential credential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: user.email!, password: password);
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    FirebaseAuth.instance.currentUser!.uid;
    credential.user?.uid;
    getUser();
  }

  static Future<userData_model?> getUser() async {
    DocumentSnapshot<userData_model> documentReference =
        await getUserCollection()
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();
    return documentReference.data();
  }

  static Future<void> creatUser(userData_model user) async {
    return await getUserCollection().doc(user.id).set(user);
  }
}
