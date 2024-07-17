import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart' as pingo_user;

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createUser(pingo_user.User user) async {
    await _db.collection('users').doc(user.email).set({
      'name': user.name,
      'email': user.email,
    });
  }
}
