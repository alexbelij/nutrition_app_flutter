import 'package:flutter/foundation.dart';

class CartItem{
  final int id;
  final String title;
  final int quantity;
  final double price;
  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier{
  Map<int ,CartItem> _items = {};
  Map<int ,CartItem> get items{
    return _items;
  }
  int get itemCount{
    return _items.length;
  }
  double get totalPrice{
    var total = 0.0;
    _items.forEach((key , item){
      total += item.price * item.quantity;
    });
    return total;
  }

  void addItem(int id , String title , double price){
    if(_items.containsKey(id)){
      _items.update(id, (existingItem){
        return CartItem(
          id: existingItem.id,
          price: existingItem.price,
          title: existingItem.title,
          quantity: existingItem.quantity + 1,
        );
      });
    } else{
      _items.putIfAbsent(id, () => CartItem(
        id: id,
        title: title,
        price: price,
        quantity: 1,
      ));
    }
    notifyListeners();
  }
  void removeItem(id){
    _items.remove(id);
    notifyListeners();
  }
  void removeSingleItem(id){
    if(!_items.containsKey(id))
      return;
    if(_items[id].quantity > 1){
       _items.update(id, (existingItem){
        return CartItem(
          id: existingItem.id,
          price: existingItem.price,
          title: existingItem.title,
          quantity: existingItem.quantity- 1,
        );
      });
    } else{
      _items.remove(id);
    }
    notifyListeners(); 
  }
  void clear(){
    _items = {};
    notifyListeners();
  }
}