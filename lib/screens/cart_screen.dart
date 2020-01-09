import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';
import './order_screen.dart';
import '../providers/orders.dart';
import '../providers/cart.dart';

class CartScreen extends StatelessWidget {
  static const route = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(15.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  OrderButton(cart : cart),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (ctx , index) => CartItemWidget(cart.items.values.toList()[index]),
            ),
          )
        ],
      ),
    );
  }
}

class OrderButton extends StatefulWidget {
  final Cart cart;
  const OrderButton({this.cart});
  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: (){
        Provider.of<Orders>(context).addOrder(widget.cart.items.values.toList(), widget.cart.totalPrice);
        Provider.of<Cart>(context).clear();
        Navigator.of(context).pushNamed(OrdersScreen.route);
      },
      child: Text('Order Now'),
    );
  }
}