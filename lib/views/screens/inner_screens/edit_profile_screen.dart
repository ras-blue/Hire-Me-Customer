import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _emailController = TextEditingController();

  TextEditingController _fullNameController = TextEditingController();

  @override
  void initState() {
    _populateController();
    super.initState();
  }

  void _populateController() async {
    String? userEmail = getUserEmail();
    String? userFullName = await getUserFullName();
    if (userEmail != null) {
      _emailController.text = userEmail;
    }
    if (userFullName != null) {
      _fullNameController.text = userFullName;
    }
  }

  String? getUserEmail() {
    User? user = _auth.currentUser;
    if (user != null) {
      return user.email;
    } else {
      return null;
    }
  }

  // fetch full name
  Future<String?> getUserFullName() async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('buyers')
            .doc(user.uid)
            .get();

        return userDoc['fullName'];
      } catch (e) {
        print('error fetching user full name: $e');
      }
    } else {
      return null;
    }
    return null;
  }

  //update user profile

  Future<void> _updateProfile() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        //update email in authentication tab
        await user.verifyBeforeUpdateEmail(_emailController.text);

        //then update email and fullname in cloud firestore

        await FirebaseFirestore.instance
            .collection('buyers')
            .doc(user.uid)
            .update({
          'email': _emailController.text,
          'fullName': _fullNameController.text,
        });

        //update controller text after successful update
        _emailController.text = _emailController.text;
        _fullNameController.text = _fullNameController.text;

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('profile updated, please check email to confirm')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('failed to update: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('edit profile'),
      ),
      body: Builder(builder: (context) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'edit your profile',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'enter email',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _fullNameController,
                  decoration: InputDecoration(
                    hintText: 'enter full name',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    _updateProfile();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'update profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
