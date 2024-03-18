
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thesushi/models/food.dart';

class FoodTile extends StatelessWidget{

  final Food food;

  final void Function()? onTap;

  FoodTile({required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.only(left: 25),
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //image
            Image.network(food.imagePath, height: 140,),

            //text
            Text(
              food.name,
              style: GoogleFonts.dmSerifDisplay(fontSize: 20),
            ),

            // price + rating
            SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //price
                  Text('\$' + food.price, style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold
                  ),),

                  //rating
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow[800],),
                      Text(food.rating, style: TextStyle(color: Colors.grey),)
                    ],
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