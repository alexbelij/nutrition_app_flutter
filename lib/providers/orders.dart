import 'package:flutter/foundation.dart';
import './cart.dart';

class OrderItem {
  final int id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;
  OrderItem(
      {@required this.id,
      @required this.amount,
      @required this.products,
      @required this.dateTime});
}

class Orders with ChangeNotifier {
  static var id = 0;
  List<OrderItem> _orders = [];
  List<OrderItem> get orders {
    return _orders;
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
        0,
        OrderItem(
            id: ++id,
            amount: total,
            products: cartProducts,
            dateTime: DateTime.now()));
    notifyListeners();
  }
}
