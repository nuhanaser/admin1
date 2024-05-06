import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  final String nameL;
  final String passwordL;
  final String phone;

  const ProfilePage(
      {super.key,
      required this.nameL,
      required this.passwordL,
      required this.phone});
  //final String nameS;
  //const ProfilePage({super.key,required this.nameS});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final pushButtonTextStyle = GoogleFonts.poppins(
      textStyle: Theme.of(context).textTheme.headlineMedium,
    );
    final counterTextStyle = GoogleFonts.montserrat(
      fontStyle: FontStyle.italic,
      textStyle: Theme.of(context).textTheme.displayLarge,
    );
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                var localizationDelegate = LocalizedApp.of(context).delegate;

                print(localizationDelegate.currentLocale.languageCode);
                if (localizationDelegate.currentLocale.languageCode == "ar")
                  changeLocale(context, "en");
                if (localizationDelegate.currentLocale.languageCode == "en")
                  changeLocale(context, "ar");
              },
              icon: Icon(
                Icons.translate,
              ),
            )
          ],
          // title: Text(widget.nameL), //how can i use widget.passwordL?

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
                        "Profile Page ",
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
      body: ListView(
        //key: _formKey,
        //child: const Column(
        //  mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 120, // Set the width to the desired size
            height: 120, // Set the height to the desired size
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/images/profile.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          /*CircleAvatar(
            radius: 60,
            backgroundColor: Colors.transparent, // Add a transparent background
            backgroundImage: const AssetImage("assets/images/profile.jpg"),
            foregroundImage: Image.asset(
              "assets/images/profile.jpg",
              fit: BoxFit.cover, // Adjusts the image to cover the entire area
              width: 10, // Set the width to the desired size
              height: 10, // Set the height to the desired size
            ).image,
          ),*/
          const SizedBox(
            height: 40,
          ),
          Container(
            //username
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "${translate("Name")}: ${widget.nameL}",
              style: pushButtonTextStyle.copyWith(fontSize: 18),
            ),
          ),
          Container(
            //password
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "${translate("Password")}: ${widget.passwordL}",
              style: pushButtonTextStyle.copyWith(fontSize: 18),
            ),
          ),
          Container(
            //phone
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "${translate("Phone")}: ${widget.phone}",
              style: pushButtonTextStyle.copyWith(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
