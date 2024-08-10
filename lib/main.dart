import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hire_me_customer/controllers/categories_controller.dart';
// import 'package:hire_me_customer/views/screens/auth/login_screen.dart';
// import 'package:hire_me_customer/views/screens/auth/welcome_screens/welcome_register_screen.dart';
import 'package:hire_me_customer/views/screens/main_screen.dart';
// import 'package:hire_me_customer/views/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
              apiKey: "AIzaSyBFjyjLt7DvZyNgpVhG6dW1BGcKlWZBX6A",
              appId: "1:66984640335:android:6e6d3be904db40b6a94f3a",
              messagingSenderId: "66984640335",
              projectId: "hire-me-da0f9",
              storageBucket: "gs://hire-me-da0f9.appspot.com"),
        )
      : await Firebase.initializeApp();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put<CategoriesController>(CategoriesController());
      }),
    );
  }
}
