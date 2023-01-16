import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:hedfon_app/models/products.model.dart';
import 'package:hedfon_app/services/firestore.dart';

class ProductsController extends GetxController {
  var _firebaseFirestore = FirebaseFirestore.instance;

  final productFB = <Products>[].obs;
  List<Products> product = [];

  File? image;
  late String pathImageStore;

  @override
  void onInit() {
    // TODO: implement onInit
    productFB.bindStream(FirestoreDB().getAllProducts());
    Future.delayed(Duration(seconds: 3), initailState);
    super.onInit();
  }

  bool conditionCheck_1 = false;
  bool conditionCheck_2 = false;
  bool conditionCheck_3 = false;
  bool conditionCheck_4 = false;

  var brandController = TextEditingController();
  var modelController = TextEditingController();
  var detailController = TextEditingController();
  var microphoneController = TextEditingController();
  var lineController = TextEditingController();
  var typeController = TextEditingController();
  var priceController = TextEditingController();

  initailState() {
    print('run');
    product = productFB;
    update();
  }

  condition(result) {
    if (conditionCheck_1 && conditionCheck_3 && conditionCheck_4 == true) {
      product = productFB
          .where((e) => e.microphone == 'มีไมค์' && e.brand == result)
          .toList();
    }

    if (conditionCheck_2 && conditionCheck_3 && conditionCheck_4 == true) {
      product = productFB
          .where((e) => e.microphone == 'ไม่มีไมค์' && e.brand == result)
          .toList();
    } else if (conditionCheck_1 && conditionCheck_3 == true) {
      product = productFB
          .where((e) =>
              e.microphone == 'มีไมค์' &&
              e.line == 'มีสาย' &&
              e.brand == result)
          .toList();
      print(product[0]);
    } else if (conditionCheck_1 && conditionCheck_4 == true) {
      product = productFB
          .where((e) =>
              e.microphone == 'มีไมค์' &&
              e.line == 'ไม่มีสาย' &&
              e.brand == result)
          .toList();
      print(product[0]);
    } else if (conditionCheck_2 && conditionCheck_3 == true) {
      product = productFB
          .where((e) =>
              e.microphone == 'ไม่มีไมค์' &&
              e.line == 'มีสาย' &&
              e.brand == result)
          .toList();
      print(product[0]);
    } else if (conditionCheck_2 && conditionCheck_4 == true) {
      product = productFB
          .where((e) =>
              e.microphone == 'ไม่มีไมค์' &&
              e.line == 'ไม่มีสาย' &&
              e.brand == result)
          .toList();
      print(product[0]);
    } else if (conditionCheck_1 == true) {
      product = productFB
          .where((e) => e.microphone == 'มีไมค์' && e.brand == result)
          .toList();
    } else if (conditionCheck_2 == true) {
      product = productFB
          .where((e) => e.microphone == 'ไม่มีไมค์' && e.brand == result)
          .toList();
      print(product.length);
    } else if (conditionCheck_3 == true) {
      product = productFB
          .where((e) => e.line == 'มีสาย' && e.brand == result)
          .toList();
    } else if (conditionCheck_4 == true) {
      product = productFB
          .where((e) => e.line == 'ไม่มีสาย' && e.brand == result)
          .toList();
    } else {
      product = productFB.where((e) => e.brand == result).toList();
    }
    print(product.length);
  }

  chooseBrand(int index) {
    switch (index) {
      case 0:
        condition(' JBL');
        update();
        break;
      case 1:
        condition('EPOS');
        update();
        break;
      case 2:
        condition('Focal');
        update();
        break;
      default:
    }

    print(product.length);
  }

  onCondition(bool value, bool check) {
    check = value;

    if (conditionCheck_1 == true) {
      product = productFB.where((e) => e.microphone == 'มีไมค์').toList();
      product.forEach(((element) => print(element.microphone)));
      update();
    }

    if (conditionCheck_2 == true) {
      product = productFB.where((e) => e.microphone == 'ไม่มีไมค์').toList();
      product.forEach(((element) => print(element.microphone)));
      update();
    } else {
      product = productFB;
    }

    if (conditionCheck_3 == true) {
      product = productFB.where((e) => e.line == 'มีสาย').toList();
      update();
    }

    if (conditionCheck_4 == true) {
      product = productFB.where((e) => e.line == 'ไม่มีสาย').toList();
      update();
    }

    update();
  }

  Future<void> chooseImage({required ImageSource imageSource}) async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? _pickedImage = await _picker.pickImage(
        source: imageSource,
        imageQuality: 100,
        maxHeight: 500,
        maxWidth: 500,
      );
      if (_pickedImage != null) {
        final Rx<File> _imagePath = File(_pickedImage.path).obs;
        image = _imagePath.value;
      }
      print(image);
      update();
      _uploadProduct(image!.path.toString());
    } catch (e) {
      print(e);
    }
  }

  Future<void> _uploadProduct(String imagePath) async {
    print(imagePath);
    var firebaseRef = await FirebaseStorage.instance
        .ref()
        .child('addproducts/${imagePath.split('/').last}');
    var uploadTask = firebaseRef.putFile(image!);
    var taskSnapshot =
        await uploadTask.whenComplete(() async {}).then((value) async {
      print('upload image success');
      // Get.snackbar('แจ้งเตือน', 'เปลี่ยนรูปภาพสำเร็จ');
      var imageUrl = await value.ref.getDownloadURL();
      // print(imageUrl.toString());

      pathImageStore = imageUrl;
      print('url : ${pathImageStore.toString()}');
    });
  }

  Future<void> addProduct(
      {required String brand,
      required String model,
      required String detail,
      required String microphone,
      required String line,
      required String type,
      required int price,
      required String image}) async {
    try {
      Random random = new Random();
      int randomNumber = random.nextInt(100);

      _firebaseFirestore.collection('Products').add({
        // 'ProId': '0',
        'Brand': brand,
        'Model': model,
        'Details': detail,
        'Microphone': microphone,
        'Line': line,
        'Type': type,
        'Price': price,
        'image': image,
      }).then((value) {
        Get.snackbar('Notification 🔔', 'Upload Product Success');
      });

      Get.back();

      brandController.clear();
      modelController.clear();
      detailController.clear();
      microphoneController.clear();
      lineController.clear();
      typeController.clear();
      priceController.clear();
      this.image == null;
    } catch (e) {
      print(e);
    }
  }
}
