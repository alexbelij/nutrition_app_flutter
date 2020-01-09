

import 'package:flutter/material.dart';
import './models/meal.dart';
import './widgets/card_item.dart';

class DetailsPage extends StatefulWidget {
  static const route = '/details';

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int counter = 1;
  var selectedCard = 'WEIGHT';
  void changeCounter(value) {
      setState(() {
        counter = value;
      });
    }
    void selectCard(selected){
      setState(() {
        selectedCard = selected;
      });
    }
  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFF7A9BEE),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Details',
          style: TextStyle(
            fontSize: 18.0,
            fontFamily: 'Montserrat',
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            color: Colors.white,
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 82.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                top: 75.0,
                child: Container(
                  height: MediaQuery.of(context).size.height - 100.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0),
                      ),
                      color: Colors.white),
                ),
              ),
              Positioned(
                top: 30.0,
                left: (MediaQuery.of(context).size.width / 2) - 100,
                child: Hero(
                  tag: meal.imageUrl,
                  child: Container(
                    height: 200.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(meal.imageUrl), fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 250,
                left: 25.0,
                right: 25.0,
                child: Column(
                  children: <Widget>[
                    Text(
                      meal.name,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '\$${meal.price}',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 22.0,
                              color: Colors.grey),
                        ),
                        Container(
                          height: 25.00,
                          width: 1.0,
                          color: Colors.grey,
                        ),
                        Container(
                          width: 125.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.0),
                            color: Color(0xFF7A9BEE),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 25.0,
                                height: 25.0,
                                child: IconButton(
                                  padding: EdgeInsets.only(bottom: 1),
                                  icon: Icon(Icons.remove),
                                  iconSize: 20.0,
                                  onPressed: () => changeCounter(--counter),
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                counter.toString(),
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15.0,
                                    color: Colors.white),
                              ),
                              InkWell(
                                onTap: () => changeCounter(++counter),
                                child: Container(
                                  height: 25.0,
                                  width: 25.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.0),
                                      color: Colors.white),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      size: 20.0,
                                      color: Color(0xFF7A9BEE),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: meal.consistsOf.length,
                        itemBuilder: (ctx, index) {
                          return Row(
                            children: <Widget>[
                              CardItem(meal.consistsOf[index] , selectCard , counter , selectedCard==meal.consistsOf[index].item),
                              SizedBox(
                                width: 20.0,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Container(
                        height: 50.0,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xFF7A9BEE),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '\$${meal.price * counter}',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
