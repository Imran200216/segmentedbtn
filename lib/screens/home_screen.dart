import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedControl = 0;

  // Correctly typed children map
  final Map<int, Widget> children = {
    0: Text(
      "News",
      style: GoogleFonts.montserrat(
        fontSize: 14, // Increased font size
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
    1: Text(
      "Feeds",
      style: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
    2: Text(
      "Favorites",
      style: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF407BFF),
        centerTitle: true,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(
              size: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Segmented Button",
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Transform.scale(
                scale: 1.2,
                child: CupertinoSlidingSegmentedControl<int>(
                  groupValue: selectedControl,
                  children: children,
                  onValueChanged: (value) {
                    setState(() {
                      selectedControl = value!;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            selectedControl == 0
                ? Column(
                    children: [
                      SvgPicture.asset(
                        "assets/images/svg/news.svg",
                        height: 400,
                        width: 400,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "No news added!",
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                : selectedControl == 1
                    ? Column(
                        children: [
                          SvgPicture.asset(
                            "assets/images/svg/feeds.svg",
                            height: 400,
                            width: 400,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "No feeds added!",
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          SvgPicture.asset(
                            "assets/images/svg/favorite.svg",
                            height: 400,
                            width: 400,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "No favorite added!",
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
          ],
        ),
      ),
    );
  }
}
