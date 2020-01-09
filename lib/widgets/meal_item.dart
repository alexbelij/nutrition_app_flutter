import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../models/meal.dart';
import '../detailsPage.dart';
class MealItem extends StatelessWidget {
  final Meal meal;
  MealItem({this.meal});
  @override
  Widget build(BuildContext context) {
    return  Padding(
    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
    child: InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(DetailsPage.route , arguments: meal);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Hero(
            tag: meal.imageUrl,
            child: Image(
              image: AssetImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 75.0,
              width: 75.0,
            ),
          ),
          SizedBox(width: 10.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                meal.name,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                '\$ ${meal.price}',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,
                  color: Colors.grey
                ),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.black,
            onPressed: () => Provider.of<Cart>(context).addItem(meal.id, meal.name, meal.price),
          )
        ],
      ),
    ),
  );
  }
}