import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  CartItemWidget(this.item);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.id),
      background: Container(
        padding: EdgeInsets.only(right: 20.0),
        margin: EdgeInsets.symmetric(vertical: 4 , horizontal: 15.0),
        alignment: Alignment.centerRight,
        color: Theme.of(context).errorColor,
        child: Icon(Icons.delete , size : 40.0 , color: Colors.white,),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction){
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            
            title: Text('Are you sure?'),
            content: Text('Do you want to remove item from the cart?'),
            actions: <Widget>[
              
              RaisedButton(
                child: Text('No' , style: TextStyle(color: Colors.white),),
                onPressed: () => Navigator.of(ctx).pop(false),
              ),
              FlatButton(
                child: Text('Yes'),
                onPressed: () => Navigator.of(ctx).pop(true),
              ),
            ],
          )
        );
      },
      onDismissed: (_){
        Provider.of<Cart>(context , listen: false).removeItem(item.id);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4.0 , horizontal: 15.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: FittedBox(
                  child: Text('\$${item.price}'),
                ),
              ),
            ),
            title: Text(item.title),
            subtitle: Text('\$${item.price * item.quantity}'),
            trailing: Text('${item.quantity} x'),
          ),

        ),
      ),
    );
  }
}