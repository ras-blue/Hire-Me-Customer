import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hire_me_customer/controllers/categories_controller.dart';

class CategoryItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CategoriesController _categoryController =
        Get.find<CategoriesController>();
    return Obx(() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'see all',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlueAccent),
                )
              ],
            ),
          ),
          GridView.builder(
              itemCount: _categoryController.categories.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, crossAxisSpacing: 8, mainAxisSpacing: 8),
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.11,
                        height: MediaQuery.of(context).size.height * 0.11,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * 0.8 / 2,
                          ),
                          border: Border.all(
                            color: Colors.red,
                          ),
                        ),
                        child: Image.network(
                          _categoryController.categories[index].categoryImage,
                        ),
                      ),
                      Text(
                        _categoryController.categories[index].categoryName
                            .toUpperCase(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ],
      );
    });
  }
}
