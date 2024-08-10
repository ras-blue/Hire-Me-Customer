import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hire_me_customer/models/category_models.dart';

class CategoriesController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxList<CategoryModels> categories = <CategoryModels>[].obs;

  @override
  void onInit() {
    super.onInit();
    _fetchCategories();
  }

  void _fetchCategories() {
    _firestore
        .collection('Categories')
        .snapshots()
        .listen((QuerySnapshot querysnapshot) {
      categories.assignAll(querysnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;

        return CategoryModels(
            categoryImage: data['image'], categoryName: data['categoryName']);
      }));
    });
  }
}
