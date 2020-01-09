import 'package:flutter/material.dart';
import '../models/meal_description.dart';

class CardItem extends StatefulWidget {
  final MealDescription details;
  final Function select;
  final counter;
  final selectedCard;
  CardItem(this.details , this.select , this.counter , this.selectedCard);
  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.select(widget.details.item);
      },
      child: AnimatedContainer(
        height: 100.0,
        width: 100.0,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: widget.selectedCard
                ? Color(0xFF7A9BEE)
                : Colors.white,
            border: Border.all(
              color: widget.selectedCard
                  ? Color(0xFF7A9BEE)
                  : Colors.grey.withOpacity(0.3),
              style: BorderStyle.solid,
              width: 0.75,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 15.0),
              child: Text(
                widget.details.item,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12.0,
                  color: widget.selectedCard
                      ? Colors.white
                      : Colors.grey.withOpacity(0.7),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.details.unit,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12.0,
                      color: widget.selectedCard
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  if (widget.details.info is int)
                  Text(
                    '${widget.details.info * widget.counter}',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12.0,
                      color: widget.selectedCard
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  if (widget.details.info is String)
                  Text(
                    widget.details.info,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12.0,
                      color: widget.selectedCard
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
