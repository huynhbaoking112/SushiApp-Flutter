import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:thesushi/components/button.dart';
import 'package:thesushi/components/food_tile.dart';
import 'package:thesushi/models/food.dart';
import 'package:thesushi/models/shop.dart';
import 'package:thesushi/pages/cart_page.dart';
import 'package:thesushi/pages/food_details_page.dart';
import 'package:thesushi/theme/color.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MenuPageState();
  }
}

class _MenuPageState extends State<MenuPage> {
  // List<Food> foodMenu = Shop().foodMenu;

  void navigateToFoodDetials(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FoodDetailsPage(food: foodMenu[index])));
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: Icon(Icons.menu),
        foregroundColor: Colors.grey[800],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Tokyo', style: TextStyle(fontWeight: FontWeight.w600),)],
        ),
        actions: [
          //cart Button
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(),));
          }, icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(
        children: [
          //promo banner
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    //promo message
                    Text("Get 32% Promo",
                        style: GoogleFonts.dmSerifDisplay(
                            fontSize: 20, color: Colors.white)),

                    const SizedBox(
                      height: 20,
                    ),
                    //redeem button
                    MyButton(text: 'Redeem', onTap: () {})
                  ],
                ),
                Image.network(
                    'https://cdn-icons-png.flaticon.com/128/3183/3183480.png')
              ],
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          //search bar

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search here...',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          //menu list

          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text('Food Menu',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
          ),

          const SizedBox(
            height: 10,
          ),

          //popular food

          Expanded(
              child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foodMenu.length,
            itemBuilder: (context, index) => FoodTile(
              food: foodMenu[index],
              onTap: () => navigateToFoodDetials(index),
            ),
          )),

          const SizedBox(
            height: 25,
          ),

          Container(
            padding: EdgeInsets.all(25),
            margin: EdgeInsets.all(25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.network(
                      'https://cdn-icons-png.flaticon.com/128/3183/3183422.png',
                      height: 60,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Salmon Eggs',
                            style: GoogleFonts.dmSerifDisplay(fontSize: 17)),
                        Text(
                          '\$21.00',
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.check_circle_outline,
                  size: 27,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
