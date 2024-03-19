import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:thesushi/models/food.dart';
import 'package:thesushi/models/shop.dart';
import 'package:thesushi/theme/color.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;

  FoodDetailsPage({required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int num = 0;

  void addIcon() {
    setState(() {
      num++;
    });
  }

  void removeIcon() {
    setState(() {
      num == 0 ? 0 : num--;
    });
  }

  void addToCard() {
    if (num > 0) {
      //get access to shop
      final shop = context.read<Shop>();

      // add to cart
      shop.addToCart(widget.food, num);
      // let the user know it was successful
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          content: Text(
            'Successfully added to cart',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          backgroundColor: primaryColor,
          actions: [
            //okay button
            IconButton(
                onPressed: () {
                  //pop once to remove dialog box
                  Navigator.pop(context);
                  //pop again to go previous screen
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.done,
                  color: Colors.green,
                  size: 25,
                ))
          ],
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                // Transform.scale(child: Image.network(widget.food.imagePath),scale: 1.3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.scale(
                      child: Image.network(widget.food.imagePath),
                      scale: 1.3,
                    )
                  ],
                ),
                SizedBox(
                  height: 45,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow[700],
                    ),
                    SizedBox(width: 5),
                    Text(
                      widget.food.rating,
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  widget.food.name,
                  style: GoogleFonts.dmSerifDisplay(fontSize: 25),
                ),
                SizedBox(
                  height: 25,
                ),
                Text('Description',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Salmon Sushi is a popular and delicious Japanese dish that combines the freshness of raw salmon with the delicate flavors of sushi rice and other complementary ingredients. It is a type of sushi known as Nigiri, where a small mound of seasoned rice is topped with a thin slice of raw salmon. The salmon used in salmon sushi is typically high-quality, sushi-grade salmon, which is known for its buttery texture and rich, savory taste. The salmon is carefully sliced and placed on top of a small, hand-formed ball of vinegared rice. The combination of the tender salmon. ",
                  style: TextStyle(
                      height: 2,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[700]),
                )
              ],
            )),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$' + widget.food.price,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Row(
                              children: [
                                Container(
                                  child: IconButton(
                                      onPressed: removeIcon,
                                      icon: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      )),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(50, 200, 200, 200),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                SizedBox(
                                  width: 60,
                                  child: Text(
                                    num.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                                Container(
                                  child: IconButton(
                                      onPressed: addIcon,
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      )),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(50, 200, 200, 200),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            onPressed: addToCard,
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(50, 200, 200, 200),
                                padding: EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Add To Cart',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                )
                              ],
                            ))
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
