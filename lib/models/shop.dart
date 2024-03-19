import 'package:flutter/cupertino.dart';
import 'package:thesushi/models/food.dart';
import 'package:thesushi/models/item_in_cart.dart';


class Shop extends ChangeNotifier {
  List<Food> _foodMenu = [
    Food(
        name: 'Salmon Sushi',
        price: "21.00",
        imagePath: 'https://cdn-icons-png.flaticon.com/128/4977/4977805.png',
        rating: '4.9'),
    Food(
        name: 'Tuna',
        price: "23.00",
        imagePath: 'https://cdn-icons-png.flaticon.com/128/4001/4001024.png',
        rating: '4.3'),
  ];

  //customer cart
  List<itemInCart> _cart = [];

  //getter method
  List<Food> get foodMenu => _foodMenu;
  List<itemInCart> get cart => _cart;

  //add to cart
  void addToCart(Food food,int quantity){

    int index =  _cart.indexWhere((element) => element.food == food);

    index != -1 ? _cart[index].quantity += quantity : _cart.add(itemInCart(food: food, quantity: quantity));
    notifyListeners();
  }

  // remove from cart

  void removeToCart(Food food){
    _cart.removeWhere((element) => element.food == food);
    notifyListeners();
  }

  //decrement item
  void decrementItem(Food food){
    int index =  _cart.indexWhere((element) => element.food == food);
    index != -1 ? null : _cart[index].quantity--;
    notifyListeners();
  }

  //increment item
  void incrementItem(Food food){
  int index =  _cart.indexWhere((element) => element.food == food);
  index != -1 ? null : _cart[index].quantity++;
  notifyListeners();
}

}