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
      /*body: Stack(
        fit: StackFit.expand,
        children: [
          //Container(color: Colors.red.withOpacity(0.2)),
          // Background image
          Image.asset(
            'assets/images/bg1.png',
            fit: BoxFit.cover,
          ),
        ],
      ),*/
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg1.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildBox('Box 1'),
                  _buildBox('Box 2'),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildBox('Box 3'),
                  _buildBox('Box 4'),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildBox('Box 5'),
                  _buildBox('Box 6'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildBox(String text) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.blue,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
