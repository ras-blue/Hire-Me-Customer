import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
        right: 20,
        left: 20,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/shop-svgrepo-com.svg',
            width: 30,
          ),
          SizedBox(
            width: 15,
          ),
          SvgPicture.asset(
            'assets/icons/search-svgrepo-com.svg',
            width: 30,
          ),
          SizedBox(
            width: 8,
          ),
          Flexible(
            child: SizedBox(
              width: 300,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Current Location',
                  labelText: 'Current Location',
                  isDense: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
