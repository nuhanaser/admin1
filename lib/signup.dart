import 'package:app/main.dart';
import 'package:app/profile.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  // final String name;
  //const SignupPage({super.key, required this.name});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  String userNName = "";
  String passWWord = "";
  String phone = "";

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // title: Text(widget.name),
            centerTitle: true,
            //leading: Icon(Icons.abc),
            elevation: 0,
            backgroundColor: Colors.transparent,
            //titleSpacing: 10,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(100.0),
              child: SizedBox(
                  height: 130.0,
                  child: ClipPath(
                    clipper: WaveClipperTwo(),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF156260), Color(0xFF00A896)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "SignUp ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            shadows: [
                              Shadow(
                                color: Colors.black12,
                                offset: Offset(3, 3),
                                blurRadius: 3,
                              ),
                              Shadow(
                                color: Colors.black45,
                                offset: Offset(-3, -3),
                                blurRadius: 3,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
            )),
        bottomNavigationBar: Container(
          decoration: const ShapeDecoration(
            color: Color(0xFF156260),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                    top: Radius.elliptical(100, 20),
                    bottom: Radius.elliptical(10, 20))),
          ),
          height: 80,
          width: 20,
        ),
        body: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(
                height: 100,
                width: 2000,
              ),

              //padding for username field
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 350,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          //borderSide:  const BorderSide(color: Colors.blue, width: 7.0)
                        ),
                        labelText: "Username",
                        prefixIcon: const SizedBox(
                            width: 50), // Adjust the width of the prefix icon

                        hintText: "Enter your username",
                        hintStyle: const TextStyle(fontSize: 14),
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.account_circle,
                          ),
                          onPressed: () {
                            if (userNName.isNotEmpty) {
                              /*Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) => SignupPage(
                                    name: username,
                                  ),
                                ),
                              );*/
                            } else {
                              print("OPS!");
                            }
                            /*setState(() {
                            _showPassword = !_showPassword;
                          });*/
                          },
                        ),
                      ),
                      onChanged: (value) {
                        print(value);
                        userNName = value;
                      },
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          return null;
                        } else {
                          return "please add name has at leaset 1 chars";
                        }
                      },
                    ),
                  )),
              //padding for password
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 350,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          //borderSide:  const BorderSide(color: Colors.blue, width: 7.0)
                        ),
                        labelText: "Password",
                        prefixIcon: const SizedBox(
                            width: 50), // Adjust the width of the prefix icon

                        hintText: "Enter your password",
                        hintStyle: const TextStyle(fontSize: 14),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            // تبديل قيمة المتغير لعرض/إخفاء كلمة المرور
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                        ),
                      ),
                      onChanged: (value) {
                        print(value);
                        passWWord = value;
                      },
                      validator: (value) {
                        if (value!.length >= 8) {
                          if (value.contains("@")) {
                            return null;
                          } else {
                            return "please add @ char in your password";
                          }
                        } else {
                          return "please add name has at leaset 8 chars";
                        }
                      },
                    ),
                  )),
              //padding for phone
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 350,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        print(value);
                        phone = value;
                      },
                      validator: (value) {
                        value = replaceNumbers(value);
                        String patttern = r'(^(?:[+0]9)?[0-9]{9,10}$)';
                        RegExp regExp = new RegExp(patttern);
                        if (value.length > 8) {
                          if (value.toString()[0] == "0" &&
                              value.toString()[1] == "7" &&
                              value.length == 9) {
                            return 'pleaseEnterValidMobileNumber';
                          } else if (value.toString()[0] != "0" &&
                              value.toString()[1] == "7" &&
                              value.length > 10) {
                            return 'pleaseEnterValidMobileNumber';
                          } else if (value.toString()[0] != "0" ||
                              value.toString()[1] != "7") {
                            return 'pleaseEnterValidMobileNumber';
                          } else if (!regExp.hasMatch(value)) {
                            return 'pleaseEnterValidMobileNumber';
                          }
                        } else {
                          return 'pleaseEnterValidMobileNumber';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          //borderSide:  const BorderSide(color: Colors.blue, width: 7.0)
                        ),
                        labelText: "Phone",
                        prefixIcon: const SizedBox(
                            width: 50), // Adjust the width of the prefix icon

                        hintText: "Enter your Phone Number",
                        hintStyle: const TextStyle(fontSize: 14),
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.phone,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  )),
              const SizedBox(height: 15),
              //signup button
              InkWell(
                onTap: () {
                  if (userNName.isNotEmpty) {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => ProfilePage(
                            nameL: userNName,
                            passwordL: passWWord,
                            phone: phone),
                      ),
                    );
                  }
                },
                child: Container(
                  width: 130,
                  decoration: BoxDecoration(
                    color: const Color(0xFF156260), // Background color
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Shadow color
                        spreadRadius: 1, // Spread radius
                        blurRadius: 3, // Blur radius
                        offset: const Offset(0, 2), // Offset
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 12, horizontal: 20), // Padding
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.person_add, // Signup icon
                        color: Colors.white.withOpacity(0.7), // Icon color
                      ),
                      const SizedBox(width: 6), // Spacing between icon and text
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white..withOpacity(0.1), // Text color
                          fontSize: 16, // Font size
                          // fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color:
                                  Colors.black.withOpacity(0.2), // Shadow color
                              offset: const Offset(0, 2), // Offset
                              blurRadius: 3, // Blur radius
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ), // Space between login button and text
              const Text(
                "Already have an account?",
                style: TextStyle(
                  color: Colors.black, // Text color
                  fontSize: 16, // Font size
                ),
              ),
              const SizedBox(height: 5),
              //login button
              InkWell(
                onTap: () {
                  if (userNName.isNotEmpty) {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const MyApp(),
                      ),
                    );
                  }

                  _formKey.currentState!.validate();
                },
                child: Container(
                  width: 130,
                  decoration: BoxDecoration(
                    color: Color(0xFF156260), // Background color
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Shadow color
                        spreadRadius: 1, // Spread radius
                        blurRadius: 3, // Blur radius
                        offset: Offset(0, 2), // Offset
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 12, horizontal: 20), // Padding
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.login, // Login icon
                        color: Colors.white.withOpacity(0.7), // Icon color
                      ),
                      const SizedBox(width: 6), // Spacing between icon and text
                      Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white..withOpacity(0.1), // Text color
                          fontSize: 16, // Font size
                          fontFamily: 'Open Sans',
                          //fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color:
                                  Colors.black.withOpacity(0.2), // Shadow color
                              offset: const Offset(0, 2), // Offset
                              blurRadius: 3, // Blur radius
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ])));
  }

  String replaceNumbers(value) {
    value = value.replaceAll(RegExp(r'٠'), '0');
    value = value.replaceAll(RegExp(r'١'), '1');
    value = value.replaceAll(RegExp(r'٢'), '2');
    value = value.replaceAll(RegExp(r'٣'), '3');
    value = value.replaceAll(RegExp(r'٤'), '4');
    value = value.replaceAll(RegExp(r'٥'), '5');
    value = value.replaceAll(RegExp(r'٦'), '6');
    value = value.replaceAll(RegExp(r'٧'), '7');
    value = value.replaceAll(RegExp(r'٨'), '8');
    value = value.replaceAll(RegExp(r'٩'), '9');
    return value;
  }
}
