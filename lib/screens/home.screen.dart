import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hedfon_app/controller/products.controller.dart';
import 'package:hedfon_app/models/brands.model.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var productsController = Get.put(ProductsController());

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  var selected;

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    return Scaffold(
      key: _key,
      bottomNavigationBar: bottomNav(size),
      drawer: Drawer(
        child: SafeArea(
          child: GetBuilder<ProductsController>(builder: (context) {
            return Column(
              children: [
                Text(
                  'เงื่อนไข',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text('ไมค์โครโฟน'),
                CheckboxListTile(
                  value: productsController.conditionCheck_1,
                  onChanged: (value) {
                    productsController.conditionCheck_1 = value as bool;
                    productsController.onCondition(
                        value as bool, productsController.conditionCheck_1);
                    print(productsController.conditionCheck_1.toString());
                  },
                  title: Text('มีไมค์'),
                ),
                CheckboxListTile(
                  value: productsController.conditionCheck_2,
                  onChanged: (value) {
                    productsController.conditionCheck_2 = value as bool;
                    productsController.onCondition(
                        value as bool, productsController.conditionCheck_2);
                    print(productsController.conditionCheck_2.toString());
                  },
                  title: Text('ไม่มีไมค์'),
                ),
                Text('สาย / ไร้สาย'),
                CheckboxListTile(
                  value: productsController.conditionCheck_3,
                  onChanged: (value) {
                    productsController.conditionCheck_3 = value as bool;
                    productsController.onCondition(
                        value as bool, productsController.conditionCheck_3);
                    print(productsController.conditionCheck_3.toString());
                  },
                  title: Text('มีสาย'),
                ),
                CheckboxListTile(
                  value: productsController.conditionCheck_4,
                  onChanged: (value) {
                    productsController.conditionCheck_4 = value as bool;
                    productsController.onCondition(
                        value as bool, productsController.conditionCheck_4);
                    print(productsController.conditionCheck_4.toString());
                  },
                  title: Text('ไร้สาย'),
                ),
                SizedBox(height: 20),
                Text(
                  '*กดติ๊กถูกแล้วกรุณากดชื่อแบรนด์อีกครั้ง*',
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () => (Get.toNamed('/addpro')),
                    child: Container(
                      width: size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        border: Border.all(color: Colors.amber.shade500),
                      ),
                      child: Center(
                        child: Text(
                          'เพิ่มข้อมูล',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            // color: Colors.blue.shade400,
          ),
          Positioned(
            top: 20,
            child: Transform.scale(
              scale: 2,
              child: Container(
                width: 70,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.amber.shade500,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Container(
            width: size.width,
            height: size.height,
            // color: Colors.blue.shade300,
            decoration: BoxDecoration(
                // border: Border.all(),
                ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Menu
                    MenuBar(),
                    // Search
                    SearchBar(size),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FadeInLeft(
                        child: Text(
                          'Choose Brand',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Brands
                    CategoryBrands(size),
                    SizedBox(height: 20),

                    // Promotions
                    Row(
                      children: [
                        FadeInUp(
                          child: Text(
                            'Popular',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        FadeInUp(
                          delay: Duration(milliseconds: 500),
                          child: Text(
                            'Discount',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        FadeInUp(
                          delay: Duration(milliseconds: 700),
                          child: Text(
                            'Exclusive',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    // Products
                    Products(size),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container bottomNav(Size size) {
    return Container(
      width: size.width,
      height: 100,
      // decoration: BoxDecoration(border: Border.all()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                Text('Home'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.dashboard,
                  size: 30,
                ),
                Text('Something'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_border_outlined,
                  size: 30,
                ),
                Text('Favorite'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person_outline,
                  size: 30,
                ),
                Text('Favorite'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget Products(Size size) {
    return Container(
      width: size.width,
      height: size.height / 2,
      // color: Colors.blue,
      child: GetBuilder<ProductsController>(builder: (context) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
          ),
          itemCount: productsController.product.length,
          itemBuilder: (context, index) {
            var value = productsController.product[index];
            return LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              print(size.width);
              print(constraints.maxWidth);
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    // print(value.proId);
                    Get.toNamed('/detail', arguments: [
                      value.image,
                      value.brand,
                      value.model,
                      value.detail,
                      value.price,
                    ]);
                  },
                  child: Container(
                    width: constraints.maxWidth,
                    height: constraints.maxWidth,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ZoomIn(
                          delay: Duration(milliseconds: 500),
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: NetworkImage(value.image),
                              fit: BoxFit.contain,
                            )),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElasticIn(
                            delay: Duration(milliseconds: 200),
                            child: Text(
                              value.model,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        ElasticIn(
                          delay: Duration(milliseconds: 10 * (index * 2)),
                          child: Text(
                            '฿ ${NumberFormat.decimalPattern().format(value.price)}',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
          },
        );
      }),
    );
  }

  Widget CategoryBrands(Size size) {
    return Container(
      width: size.width,
      height: 120,
      // color: Colors.black,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: brands.length,
        itemBuilder: (context, index) {
          var value = brands[index];
          return ElasticIn(
            child: GestureDetector(
              onTap: () {
                print(index);
                productsController.chooseBrand(index);
              },
              child: Container(
                margin: EdgeInsets.only(right: 10),
                width: 120,
                // color: Colors.black,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  border: Border.all(color: Colors.amber.shade500),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * 0.2,
                      height: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(value.image),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      value.brand,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget SearchBar(Size size) {
    return Row(
      children: [
        FadeInLeft(
          child: Container(
            width: size.width * 0.8,
            child: TextFormField(
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.transparent,
                contentPadding: EdgeInsets.only(left: 20),
                hintText: 'Search Here',
                suffixIcon: Icon(
                  Icons.search,
                  size: 24,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusColor: Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        FadeInRight(child: Icon(Icons.mic)),
      ],
    );
  }

  Widget MenuBar() {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (() {
              _key.currentState!.openDrawer();
            }),
            child: FadeInLeft(child: Icon(Icons.menu, size: 28)),
          ),
          FadeInUp(child: Icon(Icons.flutter_dash, size: 40)),
          FadeInRight(
            child: Row(
              children: [
                Icon(Icons.qr_code, size: 28),
                Icon(Icons.mail, size: 28),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
