import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretest/constants/themes.dart';
import 'package:pretest/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretest/providers/item_cart_provider.dart';
import 'package:pretest/providers/total_checkout.dart';

import '../providers/product_provider.dart';

class ProductWidget extends ConsumerWidget {
  final int index;

  const ProductWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(proudctNotifierProvider);
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
                child: Image.asset(product[index].imgUrl),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product[index].title,
                    style: AppTheme.kCardTitle,
                  ),
                  Text(product[index].shortDescription, style: AppTheme.kBodyText),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product[index].price}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Consumer(
                    builder: (BuildContext context, WidgetRef ref, Widget? child) {
                      return IconButton(
                          color: kBlackColor,
                          onPressed: () {
                            ref.read(totalNotifierProvider.notifier).addItem(product[index].pid);
                          },
                          icon: const Icon(
                            CupertinoIcons.add,
                            color: Colors.black,
                          ));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
