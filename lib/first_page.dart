import 'dart:async'; // Add this import for Future.delayed

import 'package:flutter/material.dart';
import 'package:app/main.dart'; // Assuming this is where MyHomePage is defined

class firstPage extends StatefulWidget {
  const firstPage({Key? key}) : super(key: key);

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  @override
  Widget build(BuildContext context) {
    // This is the delayed navigation code
    Future.delayed(const Duration(seconds: 4), () async {
      await Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration:
              const Duration(seconds: 1), // Adjust transition duration here
          pageBuilder: (context, animation, secondaryAnimation) => MyHomePage(),
        ),
      );
    });

    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Stack(
            children: [
              Positioned(
                left: -85,
                top: -138,
                child: Container(
                  width: 530,
                  height: 1155,
                  decoration: BoxDecoration(color: Color(0xFF156260)),
                ),
              ),
              Positioned(
                left: -85,
                top: -204,
                child: Container(
                  width: 530,
                  height: 1208,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 85,
                        top: 524,
                        child: Container(
                          width: 65,
                          height: 272,
                          decoration: BoxDecoration(color: Colors.white),
                        ),
                      ),
                      Positioned(
                        left: 85,
                        top: 0,
                        child: Container(
                          width: 360,
                          height: 604,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(135),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 464,
                        child: Container(
                          width: 301,
                          height: 164,
                          decoration: BoxDecoration(color: Colors.white),
                        ),
                      ),
                      Positioned(
                        left: 150,
                        top: 250,
                        child: Container(
                          width: 250,
                          height: 300,
                          decoration: BoxDecoration(
                            color: Colors
                                .white, // Light green background behind the picture
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset("assets/images/smallchef.png"),
                        ),
                      ),
                      Positioned(
                        left: 85,
                        top: 604,
                        child: Container(
                          width: 445,
                          height: 604,
                          decoration: ShapeDecoration(
                            color: Color(0xFF156260),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(135),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                left: 100,
                top: 30,
                child: Text(
                  'Invisible Chef',
                  style: TextStyle(
                    color: Color(0xFF156260),
                    fontSize: 26,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 110,
                top: 477,
                child: Text(
                  'أهلا وسهلا',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontFamily: 'Vintage',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
