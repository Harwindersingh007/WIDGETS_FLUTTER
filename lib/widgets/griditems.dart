// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:demo/models/product.dart';
import 'package:flutter/material.dart';

class GridData extends StatelessWidget {
  final Item item;
  const GridData({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Image.network(
        item.image,
        fit: BoxFit.fill,
      ),
    );
  }
}
