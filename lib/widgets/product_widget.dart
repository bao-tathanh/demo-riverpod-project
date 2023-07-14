import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretest/constants/themes.dart';
import 'package:pretest/models/product.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(offset: const Offset(0, 6), color: Colors.black.withOpacity(0.8), blurRadius: 10, spreadRadius: 0)
        ]),
        margin: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(12),
                color: kLightBackground,
                child: Image.asset(product.imgUrl),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: AppTheme.kCardTitle,
                  ),
                  Text(product.shortDescription, style: AppTheme.kBodyText),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      color: kBlackColor,
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.add,
                        color: Colors.black,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
