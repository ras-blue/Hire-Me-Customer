import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hire_me_customer/views/screens/account_screen.dart';
import 'package:hire_me_customer/views/screens/cart_screen.dart';
import 'package:hire_me_customer/views/screens/category_screen.dart';
import 'package:hire_me_customer/views/screens/favorite_screen.dart';
import 'package:hire_me_customer/views/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;

  List<Widget> _pages = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    FavoriteScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        unselectedItemColor: Colors.cyan,
        selectedItemColor: Colors.black,
        currentIndex: pageIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/shop-svgrepo-com.svg',
              width: 20,
            ),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/category-svgrepo-com.svg',
            ),
            label: 'CATEGORIES',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/cart-shopping-svgrepo-com.svg',
            ),
            label: 'CART',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/favorite-svgrepo-com.svg',
            ),
            label: 'FAVORITE',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/account-user-group-people-person-profile-svgrepo-com.svg',
            ),
            label: 'ACCOUNT',
          ),
        ],
      ),
      body: _pages[pageIndex],
    );
  }
}
