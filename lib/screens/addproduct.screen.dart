import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hedfon_app/controller/products.controller.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  var productsController = Get.find<ProductsController>();
  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade200,
        elevation: 0,
        title: Text('เพิ่มข้อมูล'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  color: Colors.amber.shade200,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: productsController.brandController,
                        decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          hintText: 'BRAND',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusColor: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: productsController.modelController,
                        decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          hintText: 'MODEL',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusColor: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: productsController.detailController,
                        decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          hintText: 'DETAIL',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusColor: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: productsController.microphoneController,
                        decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          hintText: 'MICROPHONE',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusColor: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: productsController.lineController,
                        decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          hintText: 'LINE',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusColor: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: productsController.typeController,
                        decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          hintText: 'TYPE',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusColor: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: productsController.priceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          hintText: 'PRICE',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusColor: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      GetBuilder<ProductsController>(builder: (context) {
                        return Container(
                          width: 200,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          child: productsController.image == null
                              ? Center(child: Text('ไม่มีรูปภาพ'))
                              : Image.file(productsController.image!),
                        );
                      }),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          productsController.chooseImage(
                            imageSource: ImageSource.gallery,
                          );
                        },
                        child: Container(
                          width: size.width / 4,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Center(child: Text('เลือกรูปภาพ')),
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          productsController.addProduct(
                            brand:
                                productsController.brandController.text.trim(),
                            model:
                                productsController.modelController.text.trim(),
                            detail:
                                productsController.detailController.text.trim(),
                            microphone: productsController
                                .microphoneController.text
                                .trim(),
                            line: productsController.lineController.text.trim(),
                            type: productsController.typeController.text.trim(),
                            price: int.parse(
                                productsController.priceController.text.trim()),
                            image: productsController.pathImageStore,
                          );
                        },
                        child: Container(
                          width: size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Center(
                            child: Text('เพิ่มข้อมูล'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
