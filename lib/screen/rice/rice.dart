import 'package:foodrecipe/data.dart';
import 'package:foodrecipe/global/functions.dart';
import 'package:foodrecipe/screen/details/detail.dart';
import 'package:foodrecipe/widget/custom_grid_tile.dart';
import 'package:flutter/material.dart';

class Rice extends StatelessWidget {
  final List rice = bdfood["rice"];



  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: customGridDelegate(), 
      itemCount: rice.length,
      padding: EdgeInsets.all(15),
      itemBuilder: (BuildContext context, int index){
        return CustomGridTile(
          onTap: (){
            Navigator.pushNamed(context, DetailScreen.path, arguments:  {"category": "Rice", "data": rice[index]});
          },
          imageUrl: rice[index]["image"],
          title: rice[index]["title"],
          totalIngredients: countIngredients(rice[index]["ingredients"]),
        );
      }
    );
  }
}
