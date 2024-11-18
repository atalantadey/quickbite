import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickbite/components/my_current_location.dart';
import 'package:quickbite/components/my_description_box.dart';
import 'package:quickbite/components/my_drawer.dart';
import 'package:quickbite/components/my_food_tile.dart';
import 'package:quickbite/components/my_sliver_app_bar.dart';
import 'package:quickbite/components/my_tabBar.dart';
import 'package:quickbite/model/food.dart';
import 'package:quickbite/model/restaurent.dart';
import 'package:quickbite/pages/food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
//tab controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //sort out and return a list of food items that belng to a specific category
  List<Food> _filterByCategory(FoodCategory foodcategory, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == foodcategory).toList();
  }

  //return the list of foods in a given category
  List<Widget> getFoodinTHiscategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterByCategory(category, fullMenu);
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final food = categoryMenu[index];
          return MyFoodTile(
            food: food,
            ontap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodPage(
                  food: food,
                ),
              ),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxisScrolled) => [
                MySliverAppBar(
                  title: MyTabbar(tabController: _tabController),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Divider(
                        indent: 25,
                        endIndent: 25,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      //my current location
                      const MyCurrentLocation(),
                      //description box
                      const MyDescriptionBox(),
                    ],
                  ),
                )
              ],
          body: Consumer<Restaurent>(
            builder: (context, restaurent, child) => TabBarView(
              controller: _tabController,
              children: getFoodinTHiscategory(restaurent.menu),
            ),
          )),
    );
  }
}
