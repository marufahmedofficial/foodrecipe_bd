import 'package:flutter/material.dart';
import '../../constant/constant.dart';
import '../../global/functions.dart';
import '../about_us/about_us.dart';
import '../bread/bread.dart';
import '../cooked.dart';
import '../desert/desert.dart';
import '../fast_food/fast_food.dart';
import '../favorite.dart';
import '../non_veg/non_veg.dart';
import '../rice/rice.dart';
import '../tips/tips.dart';

class HomeScreen extends StatefulWidget {
  static const String path = "HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text("Bd Food Recipes".toUpperCase()),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Favorite.path);
              },
              icon: const Icon(Icons.favorite),
            )
          ],
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.black87,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/non_veg/1.jpg",
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, Favorite.path);
                  },
                  title: const Text(
                    "Favorite",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
                const Divider(
                  thickness: 0.5,
                  color: Colors.white,
                  height: 0,
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, Cooked.path);
                  },
                  title: const Text(
                    "Cooked",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
                const Divider(
                  thickness: 0.5,
                  color: Colors.white,
                  height: 0,
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, CookingTips.path);
                  },
                  title: const Text(
                    "Tips",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
                Container(
                  color: Colors.black54,
                  width: double.infinity,
                  height: 60,
                  padding: const EdgeInsets.all(15.0),
                  child: const Text(
                    "More",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                ListTile(
                  onTap: () {
                    launchURL(appLink);
                  },
                  leading: const Icon(
                    Icons.rate_review,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "Rate Us",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
                ListTile(
                  onTap: () {
                    launchURL(appLink);
                  },
                  leading: const Icon(
                    Icons.update,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "Update",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, AboutUs.path);
                  },
                  leading: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "About us",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TabBar(
                  isScrollable: true,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                  indicatorWeight: 1.0,
                  indicatorColor: Colors.orange,
                  labelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Gilroy"),
                  unselectedLabelColor: Colors.red,
                  labelColor: Colors.white,
                  indicator: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4.0)),
                  tabs: const [
                    Tab(
                        child: Text(
                      "Rice",
                    )),
                    Tab(child: Text("Desert")),
                    Tab(child: Text("Bread")),
                    Tab(child: Text("Fast-Food")),
                    Tab(child: Text("Non-Veg")),
                  ]),
            ),
            Expanded(
              child: TabBarView(
                  children: [Rice(), Desert(), Bread(), FastFood(), NonVeg()]),
            )
          ],
        ),
      ),
    );
  }
}
