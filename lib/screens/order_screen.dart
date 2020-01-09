import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const route = '/orders';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: Consumer<Orders>(
        builder: (_ ,orderData,__) => ListView.builder(
          itemCount: orderData.orders.length,
          itemBuilder: (_ ,index) => OrderItemWidget(orderData.orders[index]),
        ),
      ),
    );
  }
}