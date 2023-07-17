import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/list_products.dart';
import '../models/product.dart';

List<Product> listTotal = [];

class ListTotalNotifer extends StateNotifier<List<Product>> {
  ListTotalNotifer() : super(listTotal);

  void addItem(int pid) {
    Product? product;
    for (final i in productItems) {
      if (i.pid == pid) {
        product = i;
        break;
      }
    }
    if (state.contains(product)) {
      product!.qty++;
      if (product.qty > 0) product.isSelected = true;
      state = [...state];
    } else {
      product!.qty++;
      if (product.qty > 0) product.isSelected = true;
      state = [
        ...state,
        product,
      ];
    }
  }

  void removeItem(int pid) {
    Product? product;
    for (final i in productItems) {
      if (i.pid == pid) {
        product = i;
        break;
      }
    }
    if (state.contains(product) && product!.qty > 0) {
      product.qty--;
      if (product.qty < 0) {
        product.qty = 0;
        product.isSelected = false;
        state.remove(product);
      }
      state = [...state];
    }
  }

  double getSumCheckOut() {
    double ans = 0;
    for (final i in state) {
      ans += i.qty * i.price;
    }
    return ans;
  }

  int getProductQty(int pid) {
    for (final i in productItems) {
      if (i.pid == pid) {
        return i.qty;
      }
    }
    return 0;
  }
}

final totalNotifierProvider = StateNotifierProvider<ListTotalNotifer, List<Product>>((ref) => ListTotalNotifer());
