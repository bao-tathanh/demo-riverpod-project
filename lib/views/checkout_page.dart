import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretest/providers/item_cart_provider.dart';
import 'package:pretest/providers/total_checkout.dart';

import '../constants/themes.dart';

class CardPage extends ConsumerWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalCart = ref.watch(totalNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: const Text('MyCart'),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.local_mall)))
        ],
      ),
      body: Column(children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
              itemCount: totalCart.length,
              itemBuilder: (context, index) => Card(
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Row(children: [
                    Expanded(
                      flex: 1,
                      child: Image.asset(totalCart[index].imgUrl),
                    ),
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                totalCart[index].title,
                                style: AppTheme.kCardTitle,
                              ),
                              Text(
                                totalCart[index].shortDescription,
                                style: AppTheme.kBodyText,
                              ),
                              Text(
                                '\$${totalCart[index].price}',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'X${totalCart[index].qty}',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ))
                  ]),
                ),
              ),
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Have a coupon code? enter here'),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 1,
                        color: kPrimaryColor,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'FDS2023',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          child: const Row(
                            children: [
                              Text(
                                'Available',
                                style: TextStyle(color: kPrimaryColor, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.check_circle)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Fee:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Free',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'No discount',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kPrimaryColor),
                      ),
                      Text(
                        '\$${ref.watch(totalNotifierProvider.notifier).getSumCheckOut()}',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kPrimaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            )),
        Center(

          child: Container(
            margin: EdgeInsets.only(bottom: 30),
            height: 50,
            width: 200,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                ),
                onPressed: () {
                  ref.read(totalNotifierProvider.notifier).checkout();
                },
                child: const Text('Check out')),
          ),
        ),
      ]),
    );
  }
}
