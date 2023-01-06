import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    var image = Get.arguments[0];
    var brand = Get.arguments[1];
    var model = Get.arguments[2];
    var detail = Get.arguments[3];
    var price = Get.arguments[4];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: (() => Get.back()),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.mail,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.8,
              decoration: BoxDecoration(
                // border: Border.all(),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ZoomIn(
                      child: Container(
                        width: size.width,
                        height: 400,
                        decoration: BoxDecoration(
                          // border: Border.all(),
                          image: DecorationImage(
                            image: NetworkImage(image),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    FadeInLeft(
                      delay: Duration(milliseconds: 500),
                      child: Text(
                        brand,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: 10),
                    FadeInLeft(
                      delay: Duration(milliseconds: 700),
                      child: Text(
                        model,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20),
                    FadeInLeft(
                      delay: Duration(milliseconds: 900),
                      child: Text(
                        detail == '' ? 'ไม่มีรายละเอียด' : detail,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: size.width,
              height: size.height * 0.1,
              // color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FadeInLeft(
                      delay: Duration(milliseconds: 1000),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(
                              color: Colors.amber.shade500,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '฿ ${NumberFormat.decimalPattern().format(price)}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    FadeInRight(
                      delay: Duration(milliseconds: 1200),
                      child: Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.amber.shade500,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Center(
                          child: Text('Add to Cart'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
