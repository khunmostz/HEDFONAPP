import 'package:cloud_firestore/cloud_firestore.dart';

class Products {
  late String model, type, microphone, line, detail, image, brand;
  late int price;
  Products(
      {required this.model,
      required this.type,
      required this.microphone,
      required this.line,
      required this.detail,
      required this.image,
      required this.brand,
      required this.price});

  static Products fromSnapshot(DocumentSnapshot snap) {
    Products Product = Products(
        // proId: snap['ProId'],
        model: snap['Model'],
        type: snap['Type'],
        microphone: snap['Microphone'],
        line: snap['Line'],
        detail: snap['Details'],
        image: snap['image'],
        brand: snap['Brand'],
        price: snap['Price']);

    return Product;
  }
}
