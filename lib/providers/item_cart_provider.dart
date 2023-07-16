import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretest/models/product.dart';

import '../data/list_item_cart.dart';

class ItemCartNotifer extends StateNotifier<List<Product>> {
  ItemCartNotifer() : super(listItemCart);

  void increment(int pid) {
    state = [
      for (final i in state)
        if (pid == i.pid) i.copyWith(qty: i.qty += 1) else i,
    ];
  }

  void decrement(int pid) {
    state = [
      for (final i in state)
        if (pid == i.pid) i.copyWith(qty: i.qty -= 1) else i,
    ];
  }
}

final itemCartProvider = StateNotifierProvider<ItemCartNotifer, List<Product>>(
    (ref) => ItemCartNotifer());

final priceCalcProvider = StateProvider<double>((ref) {
  final itemBag = ref.watch(itemCartProvider);

  double sum = 0;
  for (var element in itemBag) {
    sum += element.price;
  }
  return sum;
});