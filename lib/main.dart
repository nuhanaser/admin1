import 'dart:ui';

import 'package:app/favo.dart';
import 'package:app/first_page.dart';
import 'package:app/food2.dart';
import 'package:app/profile.dart';
import 'package:app/signup.dart';
import 'package:app/statis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
//import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

void main() async {
  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'en', supportedLocales: ['en', 'ar']);

  runApp(LocalizedApp(delegate, MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;

    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter application',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          localizationDelegate
        ],
        supportedLocales: localizationDelegate.supportedLocales,
        locale: localizationDelegate.currentLocale,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        //home: statisPage(), // for statistics
        home: firstPage(), // for welcome
        //home: MyHomePage() //login
        //home: const foodPage(),
        //home:favPage(favoriteImagePaths: favoriteImagePaths)
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class WaveClipperTwo extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(
        size.width * 3 / 4, size.height, size.width, size.height * 0.75);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = false;
  bool isScure = true;

  @override
  bool shouldReclip(WaveClipperTwo oldClipper) => false;
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _showPassword = false;

  bool isScure = true;
  String passWord = "";
  String userName = "";
  String phone = "";

  IconData passIcon = Icons.remove_red_eye;

  TextEditingController textEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: 360,
            height: 800,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Colors.white),
            child: Stack(children: [
              Positioned(
                left: -85,
                top: -138,
                child: Container(
                  width: 530,
                  height: 1155,
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
              Positioned(
                  left: -14,
                  top: -235,
                  child: Container(
                      width: 402,
                      height: 1111,
                      child: Stack(children: [
                        Positioned(
                          left: 286,
                          top: 303,
                          child: Container(
                            width: 88,
                            height: 172,
                            decoration: BoxDecoration(color: Color(0xFF156260)),
                          ),
                        ),
                        Positioned(
                          left: 14,
                          top: 0,
                          child: Container(
                            width: 388,
                            height: 388,
                            decoration: ShapeDecoration(
                              color: Color(0xFF156260),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(111),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 388,
                          child: Container(
                            width: 388,
                            height: 723,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(111),
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 99,
                          top: 290,
                          child: Text(
                            'Invisible Chef',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 33,
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 100,
                          top: 200,
                          child: Text(
                            'تسجيل دخول',
                            style: TextStyle(
                              color: Color(0xFF156260),
                              fontSize: 27,
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 68,
                          top: 523,
                          child: SizedBox(
                            width: 250,
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'اسم المستخدم',
                                hintText: "أدخل اسم المتسخدم",
                                hintStyle: const TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                suffixIcon: const Icon(
                                    Icons.person), // Add the icon here
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 68,
                          top: 600,
                          child: SizedBox(
                            width: 250,
                            height: 50,
                            child: TextField(
                              controller: _passwordController,
                              //obscureText:!_showPassword, // استخدام قيمة معكوسة لعرض/إخفاء كلمة المرور
                              obscureText: !_showPassword,
                              decoration: InputDecoration(
                                labelText: 'كلمة المرور',
                                hintText: "أدخل كلمة المرور",
                                hintStyle: const TextStyle(fontSize: 14),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                // إضافة زر لتبديل رؤية كلمة المرور
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
                            ),
                          ),
                        ),
                        Positioned(
                          left: 110,
                          top: 695,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const statisPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFF156260), // لون الخلفية
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0), // شكل الحواف
                              ),
                              elevation: 8, // ارتفاع الظل
                            ),
                            child: const Text(
                              'تــسـجــيــل',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'Tajawal',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ] //children
                          ) //stack
                      ))
            ])));
  }
  /* Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        /*bottomNavigationBar: Container(
          decoration: const ShapeDecoration(
            color: Color(0xFF156260),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                    top: Radius.elliptical(100, 20),
                    bottom: Radius.elliptical(10, 20))),
          ),
          height: 80,
          width: 20,
        ),*/
        /*appBar: AppBar(
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
                          "Invisible Chef ",
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
            )),*/
        body: Stack(
      children: [
        Container(
          width: double.infinity, // Cover entire width of the screen
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/bg2.png'), // Replace with your asset path
              fit: BoxFit.cover, // Adjust image fit as needed
            ),
          ),
        ),
        // Centered content
        /*Center(
          child: SingleChildScrollView(
            child: Form(
              // Wrap the content with a Form
              key: _formKey, // Assign the GlobalKey to the Form
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // "Login" text
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold, // Add bold for emphasis
                      color: Colors.white, // Adjust text color
                    ),
                  ),
                  SizedBox(height: 20.0), // Add spacing
                  // Username field
                  TextFormField(
                    // Use TextFormField instead of TextField for validation
                    controller: _usernameController,
                    onChanged: (value) {
                      print(value);
                      userName = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return null; // No error if value is not empty
                      } else {
                        return "Please enter a username (at least 1 character)";
                      }
                    },
                  ),
                  SizedBox(height: 10.0), // Add spacing
                  // Password field
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true, // Hide password characters
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.length < 3) {
                        return "Please enter a password (at least 3 characters)";
                      } else {
                        return null; // No error if length is 3 or more
                      }
                    },
                  ),
                  SizedBox(height: 20.0), // Add spacing
                  // Login button
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Form is valid, proceed with login logic
                        final username = _usernameController.text;
                        final password = _passwordController.text;
                        print('Username: $username');
                        print('Password: $password');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => statisPage()),
                        );
                      } else {
                        // Form is invalid, show error messages
                        print('Form is invalid');
                      }
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 50), // Adjust button size
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),*/
      ],
    ));
  }*/
/*
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
*/

/* 
Login page (userName , password) (Forms Data) => login button ---> Profile,   Signup Button ----> Signup 
Signup Page (userName, password, phone) (Forms Data) => signup button ---> Profile,   Login Button ----> Login
Profile Page ()
 */
}
