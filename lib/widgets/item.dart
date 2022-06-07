import 'package:demo/models/product.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  // ignore: unnecessary_null_comparison
  const ItemWidget({Key? key, required this.item})
      // ignore: unnecessary_null_comparison
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 300,
            width: 300,
            child: Card(
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 5,
                      color: Colors.black,
                    ),
                    image: DecorationImage(
                        image: NetworkImage(item.image), fit: BoxFit.fill)),
              ),
            )),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.amber,
              border: Border.all(width: 4, color: Colors.black)),
          width: 290,
          height: 100,
          child: Center(
              child: Text(
            item.name,
            style: TextStyle(fontSize: 30),
          )),
        )
      ],
    );
  }
}
