import 'package:foodrecipe/data.dart';
import 'package:foodrecipe/global/functions.dart';
import 'package:foodrecipe/screen/details/detail.dart';
import 'package:foodrecipe/widget/custom_grid_tile.dart';
import 'package:flutter/material.dart';

class FastFood extends StatelessWidget {
   final List fastFood = bdfood["fast_food"];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: customGridDelegate(), 
      itemCount: fastFood.length,
      padding: EdgeInsets.all(15),
      itemBuilder: (BuildContext context, int index){
        return CustomGridTile(
          onTap: (){
            Navigator.pushNamed(context, DetailScreen.path, arguments:  {"category": "Fast Food", "data": fastFood[index]});
          },
          imageUrl: fastFood[index]["image"],
          title: fastFood[index]["title"],
          totalIngredients: countIngredients(fastFood[index]["ingredients"]),
        );
      }
    );
  }
}