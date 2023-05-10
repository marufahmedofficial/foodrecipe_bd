import 'package:foodrecipe/data.dart';
import 'package:foodrecipe/global/functions.dart';
import 'package:foodrecipe/screen/details/detail.dart';
import 'package:foodrecipe/widget/custom_grid_tile.dart';
import 'package:flutter/material.dart';

class Desert extends StatelessWidget {
  final List dessert = bdfood["dessert"];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: customGridDelegate(), 
      itemCount: dessert.length,
      padding: EdgeInsets.all(15),
      itemBuilder: (BuildContext context, int index){
        return CustomGridTile(
          onTap: (){
            Navigator.pushNamed(context, DetailScreen.path, arguments:  {"category": "Dessert", "data": dessert[index]});
          },
          imageUrl: dessert[index]["image"],
          title: dessert[index]["title"],
          totalIngredients: countIngredients(dessert[index]["ingredients"]),
        );
      }
    );
  }
}
