import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../providers/orders.dart';

class OrderItemWidget extends StatefulWidget {
  final OrderItem order;
  OrderItemWidget(this.order);
  @override
  _OrderItemWidgetState createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
              height: min(widget.order.products.length * 20.0 + 10, 100),
              child: ListView.builder(
                itemCount: widget.order.products.length,
                itemBuilder: (_, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.order.products[index].title,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${widget.order.products[index].quantity}x \$${widget.order.products[index].price}',
                      style: TextStyle(fontSize: 18.0, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
