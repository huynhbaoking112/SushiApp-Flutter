import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thesushi/models/food.dart';
import 'package:thesushi/models/item_in_cart.dart';
import 'package:thesushi/models/shop.dart';
import 'package:thesushi/theme/color.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {


    void removeFromCart(Food food, BuildContext context){
      final shop = context.read<Shop>();

      shop.removeToCart(food);

    }

    return Consumer<Shop>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: primaryColor,
              appBar: AppBar(
                foregroundColor: Colors.white,
                title: Text('My Cart'),
                backgroundColor: primaryColor,
              ),
              body: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  //get food from cart
                  final itemInCart food = value.cart[index];

                  //get food name
                  final String foodName = food.food.name;

                  //get food price
                  final String foodPrice = food.food.price;

                  //get quantity
                  final int quantity = food.quantity;

                  final double total = quantity * double.parse(foodPrice) ;

                  //return list tile
                  return Container(
                    padding: EdgeInsets.all(25),
                    margin: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(240, 240, 240, 0.5),
                    ),
                    child: ListTile(
                      title: Row(
                        children: [
                          Text(foodName, style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 18),),
                          SizedBox(width: 20,),
                          Text('x'+ '$quantity', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 18))
                        ],
                      ),
                      subtitle: Text(total.toString(),style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w700,
                        fontSize: 16
                      ),),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.white, size: 30,),
                        onPressed:() => removeFromCart(food.food, context),
                      ),
                    ),
                  );
                },
              ),
            ));
  }
}
