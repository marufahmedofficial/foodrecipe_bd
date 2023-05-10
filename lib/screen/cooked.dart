import 'package:flutter/material.dart';

import '../db/db_helper.dart';
import '../model/recipe_model.dart';

class Cooked extends StatefulWidget {
  static const String path = "Cooked";
  const Cooked({Key? key}) : super(key: key);

  @override
  _CookedState createState() => _CookedState();
}

class _CookedState extends State<Cooked> {
  countIngradients(ingradients) {
    var _ingradients =
        ingradients.toString().replaceAll("[", "").replaceAll("]", "");
    var splitIngradients = _ingradients.split(",");
    return splitIngradients.length;
  }

  countDirections(directions) {
    var _directions =
        directions.toString().replaceAll("[", "").replaceAll("]", "");
    var splitDirections = _directions.split(",");
    return splitDirections.length;
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cooked"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        height: 400,
        child: FutureBuilder(
          future: DbHelper.instance.getCookedRecipe(),
          builder: (BuildContext context,
              AsyncSnapshot<List<RecipeModel>> snapshot) {
            if (!snapshot.hasData) {
              return const Text("Loading......");
            }
            return isLoading
                ? const CircularProgressIndicator()
                : ListView(
                    children: snapshot.data!.map((recipe) {
                      return Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              recipe.image!,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${recipe.title}",
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Ingradients:  ${countIngradients(recipe.ingredients)}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "Directions:  ${countDirections(recipe.directions)}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isLoading = true;
                                });
                                DbHelper.instance.deleteCookedItem(recipe.id);
                                setState(() {
                                  isLoading = false;
                                });
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  );
          },
        ),
      ),
    );
  }
}
