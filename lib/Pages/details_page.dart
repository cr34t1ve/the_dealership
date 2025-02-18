import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class DetailsPage extends StatefulWidget {
  final String carImage;
  final String carClass;
  final String carName;
  final int carPower;
  final String people;
  final String bags;
  final int carPrice;
  final String carRating;
  final bool isRotated;

  const DetailsPage({
    Key? key,
    required this.carImage,
    required this.carClass,
    required this.carName,
    required this.carPower,
    required this.people,
    required this.bags,
    required this.carPrice,
    required this.carRating,
    required this.isRotated,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //check the size of device
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness ==
        Brightness.dark; //check if device is in dark or light mode

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0), //appbar size
        child: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          shadowColor: Colors.transparent,
          backgroundColor: isDarkMode
              ? const Color(0xff06090d)
              : const Color(0xfff8f8f8), //appbar bg color
          leading: Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.05,
            ),
            child: SizedBox(
              height: size.width * 0.1,
              width: size.width * 0.1,
              child: InkWell(
                onTap: () {
                // return back(); //go back to home page
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? const Color(0xff070606)
                        : Colors.white, //icon bg color
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Icon(
                    UniconsLine.multiply,
                    color: isDarkMode ? Colors.white : Colors.black,
                    size: size.height * 0.025,
                  ),
                ),
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leadingWidth: size.width * 0.15,
           title: Text("DEALERSHIP",
               style: GoogleFonts.poppins(
                 color: isDarkMode ? Colors.white : Colors.black,
                 fontSize: size.width * 0.06,
                 fontWeight: FontWeight.bold,
               )),
          //
          // Image.asset(
          //   isDarkMode
          //       ? 'assets/icons/SobGOGlight.png'
          //       : 'assets/icons/SobGOGdark.png',
          //   height: size.height * 0.06,
          //   width: size.width * 0.35,
          // ),
          centerTitle: true,
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            color: isDarkMode
                ? const Color(0xff06090d)
                : const Color(0xfff8f8f8), //background color
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
              ),
              child: Stack(
                children: [
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      widget.isRotated
                          ? Image.asset(
                              widget.carImage,
                              height: size.width * 0.5,
                              width: size.width * 0.8,
                              fit: BoxFit.contain,
                            )
                          : Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(pi),
                              child: Image.asset(
                                widget.carImage,
                                height: size.width * 0.5,
                                width: size.width * 0.8,
                                fit: BoxFit.contain,
                              ),
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.carClass,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.star,
                            color: Colors.yellow[800],
                            size: size.width * 0.06,
                          ),
                          Text(
                            widget.carRating,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Colors.yellow[800],
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Row(
                          children: [
                            SingleChildScrollView(
                              child: Text(
                                widget.carName,
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                  color: isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '${widget.carPrice}\GHS',
                              style: GoogleFonts.poppins(
                                color: isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: size.width * 0.04,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '/per day',
                              style: GoogleFonts.poppins(
                                color: isDarkMode
                                    ? Colors.white.withOpacity(0.8)
                                    : Colors.black.withOpacity(0.8),
                                fontSize: size.width * 0.025,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.02,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildStat(
                              UniconsLine.dashboard,

                              '${widget.carPower} KM',
                              'Power',
                              size,
                              isDarkMode,
                            ),
                            buildStat(
                              UniconsLine.users_alt,
                              'People',
                              '( ${widget.people} )',
                              size,
                              isDarkMode,
                            ),
                            buildStat(
                              UniconsLine.briefcase,
                              'Bags',
                              '( ${widget.bags} )',
                              size,
                              isDarkMode,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.03,
                        ),
                        child: Text(
                          'Current Location',
                          style: GoogleFonts.poppins(
                            color: isDarkMode
                                ? Colors.white
                                : Colors.black,
                            fontSize: size.width * 0.055,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          height: size.height * 0.15,
                          width: size.width * 0.9,
                          child: Container(
                            decoration: BoxDecoration(
                              color: isDarkMode
                                  ? Colors.white.withOpacity(0.05)
                                  : Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  10,
                                ),
                              ),
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.05,
                                      vertical: size.height * 0.015,
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            UniconsLine.map_marker,
                                            color: isDarkMode ? Colors.white : Colors.black,
                                            size: size.height * 0.05,
                                          ),
                                          Text(
                                            'Katowice Airport',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                              color: isDarkMode
                                                  ? Colors.white
                                                  :  Colors.black,
                                              fontSize: size.width * 0.05,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Wolności 90, 42-625 Pyrzowice',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                              color: isDarkMode
                                                  ? Colors.white.withOpacity(0.7)
                                                  : Colors.black.withOpacity(0.7),
                                              fontSize: size.width * 0.032,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.15,
                                    width: size.width * 0.25,
                                    // child: Container(
                                    //   decoration: const BoxDecoration(
                                    //     color: Colors.black,
                                    //     borderRadius: BorderRadius.all(
                                    //       Radius.circular(
                                    //         10,
                                    //       ),
                                    //     ),
                                    //   ),
                                    //   child: Align(
                                    //     child: Text(
                                    //       'Map Preview',
                                    //       textAlign: TextAlign.center,
                                    //       style: GoogleFonts.poppins(
                                    //         color: Colors.white,
                                    //         fontSize: size.width * 0.04,
                                    //         fontWeight: FontWeight.bold,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  buildSelectButton(size, isDarkMode),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildStat(
      IconData icon, String title, String desc, Size size, bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.015,
      ),
      child: SizedBox(
        height: size.width * 0.32,
        width: size.width * 0.25,
        child: Container(
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: size.width * 0.03,
              left: size.width * 0.03,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: const Color(0xff3b22a1),
                  size: size.width * 0.08,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.width * 0.02,
                  ),
                  child: Text(
                    title,
                    style: GoogleFonts.poppins(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  desc,
                  style: GoogleFonts.poppins(
                    color: isDarkMode
                        ? Colors.white.withOpacity(0.7)
                        : Colors.black.withOpacity(0.7),
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Align buildSelectButton(Size size, bool isDarkMode) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: EdgeInsets.only(
        bottom: size.height * 0.01,
      ),
      child: SizedBox(
        height: size.height * 0.07,
        width: size.width,
        child: InkWell(
          onTap: () {
            //TODO: add select action
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color:  isDarkMode ? Colors.white : Colors.black,
            ),
            child: Align(
              child: Text(
                'Select',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: size.height * 0.025,
                  fontWeight: FontWeight.bold,
                  color:  isDarkMode ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
