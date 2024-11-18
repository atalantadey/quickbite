import 'package:flutter/material.dart';
import 'package:quickbite/model/food.dart';

class MyTabbar extends StatelessWidget {
  final TabController tabController;

  const MyTabbar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
          unselectedLabelColor: Theme.of(context).colorScheme.inversePrimary,
          labelColor: Theme.of(context).colorScheme.primary,
          indicatorColor: Theme.of(context).colorScheme.inversePrimary,
          controller: tabController,
          tabs: _buildCategoryTabs()),
    );
  }
}
