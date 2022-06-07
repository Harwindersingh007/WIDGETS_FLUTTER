import 'dart:convert';

import 'package:demo/models/product.dart';
import 'package:demo/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var itemjson = await rootBundle.loadString("assets/files/items.json");
    final decodedData = jsonDecode(itemjson);
    var itemData = decodedData["Shoes"];
    print(itemData);
    ProductModel.Shoes =
        List.from(itemData).map<Item>((item) => Item.fromMap(item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
          title: Text("WIDGETS"),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/dog-removebg.png")),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(blurRadius: 12, color: Colors.black)
                              ],
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.blue, width: 5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                        child: Text(
                      'CONTAINER',
                      style: TextStyle(fontSize: 30),
                    ))
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 100, right: 80, top: 130),
                          child: Text(
                            "CARD",
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        elevation: 10,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200)),
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Ink.image(
                              fit: BoxFit.fitWidth,
                              height: 220,
                              width: 400,
                              image: NetworkImage(
                                  "https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")),
                        ),
                      ),
                      Center(
                          child: Text(
                        "INK IMAGE",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 100,
                  width: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Text Button",
                        style: TextStyle(fontSize: 40),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black, minimumSize: Size(130, 90)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 3, color: Colors.black),
                          primary: Colors.black,
                          minimumSize: Size(20, 20)),
                      onPressed: () {},
                      child: Text(
                        "Outlined Button",
                        style: TextStyle(fontSize: 40),
                      )),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  color: Colors.white,
                  height: 400,
                  child: ListView.separated(
                    itemCount: ProductModel.Shoes.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ItemWidget(item: ProductModel.Shoes[index]);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 4,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 400,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: ((context, index) {
                      return Container(
                          child: InkWell(
                        onTap: () {},
                        child: Card(
                          elevation: 20,
                        ),
                      ));
                    }),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1 / 1, crossAxisCount: 2),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
