// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:pretest/models/product.dart';
// import 'package:pretest/providers/total_checkout.dart';
//
// import '../data/list_item_cart.dart';
// import '../data/list_products.dart';
//
// class ItemCartNotifer extends StateNotifier<List<Product>> {
//   ItemCartNotifer() : super(listTotal);
//
//   void increment(int pid) {
//     state = [ ...state,
//       for (final i in productItems)
//         if (pid == i.pid) i.copyWith(qty: i.qty += 1, isSelected:  i.qty > 0) else i,
//
//     ];
//   }
//
//   void decrement(int pid) {
//     state = [ ...state,
//       for (final i in productItems)
//         if (pid == i.pid) i.copyWith(qty: i.qty - 1 < 0? 0 :  i.qty -= 1, isSelected: i.qty > 0) else i,
//
//     ];
//   }
//
//
// }
//
// final itemCartProvider = StateNotifierProvider<ItemCartNotifer, List<Product>>(
//     (ref) => ItemCartNotifer());
//
// final priceCalcProvider = StateProvider<double>((ref) {
//   final itemBag = ref.watch(itemCartProvider);
//
//   double sum = 0;
//   for (var element in itemBag) {
//     sum += element.price;
//   }
//   return sum;
// });