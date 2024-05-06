import 'package:flutter/material.dart';

class statisPage extends StatefulWidget {
  const statisPage({super.key});

  @override
  State<statisPage> createState() => _statisPageState();
}

class _statisPageState extends State<statisPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //String imagePath = 'assets/images/bg1.png';
    //print('Loading image: $imagePath');

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          //Container(color: Colors.red.withOpacity(0.2)),
          // Background image
          Image.asset(
            'assets/images/bg1.png',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
