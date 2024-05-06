import 'package:app/main.dart';
import 'package:flutter/material.dart';

class favPage extends StatelessWidget {
  final List<String> favoriteImagePaths;
  final List<String> imageComments;

  const favPage({
    Key? key,
    required this.favoriteImagePaths,
    required this.imageComments, // Provide initializer for imageComments
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: favoriteImagePaths.length,
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: Stack(
              children: [
                Container(
                  //height: 100,
                  // Container widget for favorite image
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  child: ClipOval(
                    // ClipOval widget for favorite image
                    child: Image.asset(
                      favoriteImagePaths[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ), // End of Container widget for favorite image
                Positioned(
                  // Positioned widget for like button
                  bottom: 5,
                  right: 5,
                  child: IconButton(
                    // IconButton widget for like button
                    icon: const Icon(
                      Icons.favorite_rounded,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      // Handle removing the image from favorites here
                      print("Removed from favorites!");
                    },
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Center(
                      child: Text(
                        imageComments.length
                            .toString(), // Use imageComments list
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
