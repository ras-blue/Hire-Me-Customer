import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hire_me_customer/controllers/auth_controller.dart';
import 'package:hire_me_customer/views/screens/auth/register_screen.dart';
import 'package:hire_me_customer/views/screens/main_screen.dart';

class CustomerLoginScreen extends StatefulWidget {
  @override
  State<CustomerLoginScreen> createState() => _CustomerLoginScreenState();
}

class _CustomerLoginScreenState extends State<CustomerLoginScreen> {
  final AuthController _authController = AuthController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String email;

  late String password;

  bool _isLoading = false;

  loginUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      String res = await _authController.loginUser(email, password);

      setState(() {
        _isLoading = false;
      });

      if (res == 'success') {
        setState(() {
          _isLoading = false;
        });
        Get.to(MainScreen());

        Get.snackbar(
          'Login Success',
          'You are logged in',
          backgroundColor: Colors.cyan,
          colorText: Colors.red,
        );
      } else {
        Get.snackbar(
          'Error occured',
          res.toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login Account',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
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
                height: 25,
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
                height: 25,
              ),
              InkWell(
                onTap: () {
                  loginUser();
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: Center(
                    child: _isLoading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              letterSpacing: 4,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CustomerRegisterScreen();
                      },
                    ),
                  );
                },
                child: Text('Need An Account?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
