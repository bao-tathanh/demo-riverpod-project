import 'package:flutter/material.dart';
import 'package:pretest/constants/themes.dart';
import 'package:pretest/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretest/providers/item_cart_provider.dart';

import '../providers/product_provider.dart';
import 'checkout_page.dart';

class DetailProduct extends ConsumerWidget {
  final int index;

  const DetailProduct({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(proudctNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: Text(product[index].title),
        centerTitle: true,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20, top: 10),
              child: Badge(
                label: Text('2'),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CardPage(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.local_mall,
                      size: 24,
                    )),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product[index].imgUrl),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Title',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('${product[index].review} reviews',
                      style: const TextStyle(
                        color: kBlackColor,
                        fontSize: 9,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(product[index].longDescription,
                      style: const TextStyle(
                        color: kBlackColor,
                        fontSize: 14,
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${product[index].price * product[index].qty}',
                          style: const TextStyle(
                              color: kPrimaryColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                ref
                                    .read(proudctNotifierProvider.notifier)
                                    .decreaseQty(product[index].pid);
                              },
                              icon: const Icon(Icons.remove_circle_outline)),
                          const Text(
                            '1',
                            style: TextStyle(fontSize: 19),
                          ),
                          IconButton(
                              onPressed: () {
                                ref
                                    .read(proudctNotifierProvider.notifier)
                                    .incrementQty(product[index].pid);
                              },
                              icon: const Icon(Icons.add_circle_outline)),
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(kPrimaryColor),
                          ),
                          onPressed: () {},
                          child: const Text('Add item to bag')),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
