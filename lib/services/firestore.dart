import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hedfon_app/models/products.model.dart';

class FirestoreDB {
  // Initialize Firebase Cloud Firestore
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Products>> getAllProducts() {
    return _firebaseFirestore
        .collection('Products')
        .orderBy('Price', descending: false)
        // .where('category', isEqualTo: 'Gucci')
        .snapshots()
        .map((snapshot) {
      // print(snapshot.docs[0]['Line']);
      return snapshot.docs.map((doc) => Products.fromSnapshot(doc)).toList();
    });
  }
}
