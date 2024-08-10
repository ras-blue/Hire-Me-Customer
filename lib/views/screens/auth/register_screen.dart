import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hire_me_customer/controllers/auth_controller.dart';
import 'package:hire_me_customer/views/screens/auth/login_screen.dart';
import 'package:image_picker/image_picker.dart';

class CustomerRegisterScreen extends StatefulWidget {
  @override
  State<CustomerRegisterScreen> createState() => _CustomerRegisterScreenState();
}

class _CustomerRegisterScreenState extends State<CustomerRegisterScreen> {
  final AuthController _authController = AuthController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  late String email;

  late String fullName;

  late String password;

  Uint8List? _image;

  selectGalleryImage() async {
    Uint8List im = await _authController.pickProfileImage(ImageSource.gallery);

    setState(() {
      _image = im;
    });
  }

  captureImage() async {
    Uint8List im = await _authController.pickProfileImage(ImageSource.camera);

    setState(() {
      _image = im;
    });
  }

  registerUser() async {
    if (_image != null) {
      if (_formKey.currentState!.validate()) {
        setState(() {
          _isLoading = true;
        });
        String res = await _authController.createNewUser(
            email, fullName, password, _image);

        setState(() {
          _isLoading = false;
        });

        if (res == 'Success') {
          setState(() {
            _isLoading = false;
          });
          Get.to(CustomerLoginScreen());

          Get.snackbar(
            'Success',
            'Account has been created',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            margin: EdgeInsets.all(
              15,
            ),
          );
        } else {
          Get.snackbar(
            'Error occured',
            res.toString(),
            backgroundColor: Colors.red,
            colorText: Colors.white,
            margin: EdgeInsets.all(
              15,
            ),
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } else {
        Get.snackbar(
          "Form",
          'not valid',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: EdgeInsets.all(
            15,
          ),
        );
      }
    } else {
      Get.snackbar(
        'No image',
        'Please select or capture image',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: EdgeInsets.all(
          15,
        ),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Register Account',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    _image == null
                        ? CircleAvatar(
                            radius: 65,
                            child: Icon(
                              Icons.person,
                              size: 55,
                            ),
                          )
                        : CircleAvatar(
                            radius: 65,
                            backgroundImage: MemoryImage(_image!),
                          ),
                    Positioned(
                      right: 0,
                      top: 15,
                      child: IconButton(
                        onPressed: () {
                          selectGalleryImage();
                        },
                        icon: Icon(
                          CupertinoIcons.photo,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Email Address Must Not Be Empty';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    hintText: 'Enter Email Address',
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {
                    fullName = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Full Name Must Not Be Empty';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    hintText: 'Enter Full Name',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {
                    password = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Password Must Not Be Empty';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    registerUser();
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                    ),
                    child: Center(
                      child: _isLoading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 4,
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CustomerLoginScreen();
                    }));
                  },
                  child: Text(
                    'Already Have An Account?',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
