import 'package:flutter/material.dart';

class Contactfrom extends StatefulWidget {
  Contactfrom({super.key});
  @override
  State<Contactfrom> createState() => _ContactfromState();
}

class _ContactfromState extends State<Contactfrom> {
  @override
  final _formkey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController Phone = TextEditingController();
  List storeinfo = ['', '', ''];
  void _submitForm() {
    if (_formkey.currentState!.validate()) {
      setState(() {
        username;
        Password;
        Phone;
      });

      storeinfo[0] = username.text;
      storeinfo[1] = Password.text;
      storeinfo[2] = Phone.text;
      username.clear();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: username,
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  decoration: InputDecoration(
                      labelText: "Username or Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty. ";
                    }
                    else if (value.length < 4) {
                      return 'Username must be at least 4 characters';
                    } else if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
                      return 'Username can only contain letters, numbers, and underscores';
                    }
                    else
                      return null;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                  TextFormField(
                  // controller: Phone,
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: Password,
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    } else if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
                      return 'Password must contain at least one uppercase letter';
                    } else if (!RegExp(r'^(?=.*[a-z])').hasMatch(value)) {
                      return 'Password must contain at least one lowercase letter';
                    } else if (!RegExp(r'^(?=.*\d)').hasMatch(value)) {
                      return 'Password must contain at least one digit';
                    } else if (!RegExp(r'^(?=.*[@$!%*?&])').hasMatch(value)) {
                      return 'Password must contain at least one special character';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: Phone,
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  decoration: InputDecoration(
                      labelText: "Phone No",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone number is required';
                        } else if (!RegExp(r'^(?:\+8801|01)[3-9]\d{8}$').hasMatch(value)) {
                          return 'Enter a valid Bangladeshi Phone Number';
                        }
                        return null;
                      },
                                  ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: ElevatedButton(
                      onPressed: _submitForm,
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey)),
                ),
                SizedBox(
                  height: 20.0,
                ),
                // Text("Your username is : ${storeinfo[0]}"),
                // Text("Your Password is : ${storeinfo[1]}"),
                // Text("Your phone is : ${storeinfo[2]}"),
              ],
            ),
          )),
    );
  }
}

