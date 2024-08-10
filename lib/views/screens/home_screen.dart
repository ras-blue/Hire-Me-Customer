import 'package:flutter/material.dart';
import 'package:hire_me_customer/views/screens/widgets/banner_widget.dart';
import 'package:hire_me_customer/views/screens/widgets/category_text_widget.dart';
import 'package:hire_me_customer/views/screens/widgets/home_products_widget.dart';
import 'package:hire_me_customer/views/screens/widgets/location_widget.dart';
import 'package:hire_me_customer/views/screens/widgets/men_products_widgets.dart';
import 'package:hire_me_customer/views/screens/widgets/reuse_test_widget.dart';
import 'package:hire_me_customer/views/screens/widgets/women_products_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LocationWidget(),
          SizedBox(
            height: 20,
          ),
          BannerWidget(),
          SizedBox(
            height: 50,
          ),
          CategoryItemWidget(),
          SizedBox(
            height: 10,
          ),
          HomeProductsWidget(),
          SizedBox(
            height: 10,
          ),
          ReuseTestWidget(
            title: "Mens products",
          ),
          SizedBox(
            height: 10,
          ),
          MenProductsWidgets(),
          SizedBox(
            height: 10,
          ),
          ReuseTestWidget(
            title: 'Womens products',
          ),
          WomenProductsWidget(),
        ],
      ),
    );
  }
}
