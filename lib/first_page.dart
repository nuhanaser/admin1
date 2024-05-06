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
    Future.delayed(const Duration(seconds: 1), () async {
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
      appBar: AppBar(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/images/bghalf.png', // Assuming bghalf.png is in the assets folder
            fit: BoxFit.cover,
          ),
          // Circular image and text in the middle
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Circular image
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/smallchef.png'), // Assuming smallchef.png is in the assets folder
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 1), // Spacer between image and text
                // Text "Welcome"
                const Positioned(
                  left: 110,
                  top: 400,
                  child: Text(
                    'أهلا وسهلا',
                    style: TextStyle(
                      height: 20,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
