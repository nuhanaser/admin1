import 'package:app/favo.dart';
import 'package:app/main.dart';
import 'package:app/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class foodPage extends StatefulWidget {
  const foodPage({super.key});

  @override
  State<foodPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<foodPage> {
  List<Map> products = [
    {'name': "Pizza", 'image': "assets/images/pizza.jpg", 'isAdded': '0'},
    {'name': "Pasta", 'image': "assets/images/pasta.jpeg", 'isAdded': '0'},
    {'name': "Meat", 'image': "assets/images/meat.jpeg", 'isAdded': '0'},
    {'name': "Salad", 'image': "assets/images/salads.jpeg", 'isAdded': '0'},
    {'name': "Dessert", 'image': "assets/images/twinzy.jpg", 'isAdded': '0'},
  ];

  final List<String> imagePaths = [
    "assets/images/pizza.jpg",
    "assets/images/pasta.jpeg",
    "assets/images/meat.jpeg",
    "assets/images/salads.jpeg",
    "assets/images/side.jpeg",
    "assets/images/soups.jpeg",
    "assets/images/desserts.jpeg",
    "assets/images/sham.jpeg",
    "assets/images/rice.jpeg",
  ];
  ScrollController controllerList = ScrollController();

  /*String usernameF = "";
  String passwordF = "";
  String phoneF = "";*/

  int index = 0; //for buttons in bottom navigation bar
  final screens = [
    //MyApp()
    //cartPage()
    //profilePage()

    const Center(
      child: Text('mail'),
    ),
    const Center(
      child: Text('nuha'),
    ),

    const Center(
      child: Text('su'),
    ),

    //ProfilePage(nameL: usernameF, passwordL: passwordF, phone: phoneF)
  ];
  final List<String> imageComments = [
    "Pizza",
    "Pasta",
    "Meat",
    "Salad",
    "Side dishes",
    "Soup",
    "Desserts",
    "Main Course",
    "Chicken"
  ];
  List<String> favoriteImagePaths = [];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListView(controller: controllerList, children: [
          const SizedBox(
            height: 20,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 100,
              mainAxisExtent: 130,
            ),
            itemCount: products.length, // itemCount widget
            itemBuilder: (BuildContext context, int index) {
              return GridTile(
                child: Stack(
                  children: [
                    Container(
                      // Container widget
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      child: ClipOval(
                        // ClipOval widget
                        child: Image.asset(
                          products[index]['image'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ), // End of Container widget
                    Positioned(
                      // Positioned widget for image comments
                      bottom: 5,
                      left: 0,
                      right: 0,
                      child: Container(
                        // Container widget for image comments
                        color: Colors.black.withOpacity(0.5),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Center(
                          child: Text(
                            products[index]['name'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ), // End of Positioned widget for image comments
                    Positioned(
                      // Positioned widget for like button
                      bottom: 5,
                      right: 5,
                      child: IconButton(
                        // IconButton widget for like button
                        icon: Icon(
                          (products[index]['isAdded'] == "0")
                              ? Icons.favorite_border
                              : Icons.favorite_rounded,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            if (products[index]['isAdded'] == "0") {
                              products[index]['isAdded'] = "1";
                            } else {
                              products[index]['isAdded'] = "0";
                            }
                            print(products[index]);
                          });
                          // Handle adding the image to favorites here
                          print("Added to favorites!");
                        },
                      ),
                    ), // End of Positioned widget for like button
                  ],
                ),
              );
            }, // End of itemBuilder function
          ), // End of GridView.builder widget
        ]), // End of ListView widget
        bottomNavigationBar: NavigationBarTheme(
          data: const NavigationBarThemeData(
            indicatorColor: Colors.white,
            surfaceTintColor: Colors.yellow,
          ),
          child: NavigationBar(
            //onDestinationSelected:
            height: 60,
            backgroundColor: const Color(0xFF156260),
            selectedIndex: index,
            onDestinationSelected: (int selectedIndex) {
              setState(() {
                index = selectedIndex;
                if (selectedIndex == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => favPage(
                        favoriteImagePaths: favoriteImagePaths,
                        imageComments: imageComments,
                      ),
                    ),
                  );
                } else if (selectedIndex == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(
                        nameL: '',
                        passwordL: '',
                        phone: '',
                      ), // Navigate to profilePage
                    ),
                  );
                } else if (selectedIndex == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MyHomePage() // Navigate to profilePage
                        ),
                  );
                }
              });
            },

            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: "Home"),
              NavigationDestination(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  label: "Favorite"),
              NavigationDestination(
                  icon: Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                  label: "Profile"),
            ],
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
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
                      "Food Types ",
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
              ),
            ),
          ),
        ),
      ); // End of Scaffold widget
} // End of _MyWidgetState class
