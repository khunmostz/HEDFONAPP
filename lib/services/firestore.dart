import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hedfon_app/models/products.model.dart';

class FirestoreDB {
  // Initialize Firebase Cloud Firestore
  // final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Products>> getAllProducts() {
    return FirebaseFirestore.instance
        .collection('Products')
        .orderBy('Price', descending: false)
        // .where('category', isEqualTo: 'Gucci')
        .snapshots()
        .map((snapshot) {
      print(snapshot.docs.length);
      return snapshot.docs
          // .sublist(0, 10)
          .map((doc) => Products.fromSnapshot(doc))
          .toList();
    });
  }
}
