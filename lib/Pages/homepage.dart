import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:the_dealership/Pages/fleet.dart';
import 'package:the_dealership/Pages/rentals.dart';
import 'package:the_dealership/widgets/bottom_nav_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:the_dealership/widgets/homePage/fleets.dart';
import 'package:the_dealership/widgets/homePage/most_rented.dart';
import 'package:unicons/unicons.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  bool drawerOpen = true;

  @override
  Widget build(BuildContext context) {
    final List<String> imageListfleet = [
      "assets/images/yaris.png",
      "assets/images/Lincoln.png",
      "assets/images/mondeo.png",
      "assets/images/bentley02.png",
      "assets/images/Sentra.png",
      "assets/images/corolla.png",
      //'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];

//Images for car rental
    final List<String> imageListrental = [
      "assets/images/juke.png",
      "assets/images/v8.png",
      "assets/images/Tahoe.png",
      "assets/images/ford.png",
      "assets/images/lux.png",
      "assets/images/v8.png",

      //'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];

    Size size = MediaQuery.of(context).size; //check the size of device
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness ==
        Brightness.dark; //check if device is in dark or light mode

    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              Column(
                children: [
                  SizedBox(
                    height: 210,
                    child: DrawerHeader(
                      child: Container(
                        height: 500,
                        child: Column(children: const [
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 50,
                            child: Text(
                              'Dealership',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ), //Text
                          ),
                          Text(
                            'UserName',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Email',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
              ListTile(
                leading: const Icon(
                  Icons.account_circle,
                  size: 30,
                ),
                title: Text('Profile'),
                subtitle: Text("View your account details here"),
                trailing: Icon(Icons.more_vert),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.info,
                  size: 30,
                ),
                title: Text('About'),
                subtitle: Text("Learn about us "),
                trailing: Icon(Icons.more_vert),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.aod,
                  size: 30,
                ),
                title: Text('Orders'),
                subtitle: Text("This is the 1st item"),
                trailing: Icon(Icons.more_vert),
                onTap: () {},
              ),
              ListTile(
                title: Text('Second item'),
                onTap: () {},
              ),
            ]),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0), //appbar size
        child: AppBar(
          shadowColor: Colors.transparent,

          backgroundColor:
              isDarkMode ? const Color(0xff06090d) : const Color(0xfff8f8f8),
          leading: Builder(
              builder: (context) => IconButton(
                    icon: new Icon(
                      Icons.menu,
                      color: isDarkMode
                          ? Colors.white
                          : Colors.black, //icon bg color
                      size: size.height * 0.025,
                    ),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    // ),
                    //       bottomOpacity: 0.0,
                    //       elevation: 0.0,
                    //       shadowColor: Colors.transparent,
                    //       backgroundColor:
                    //           isDarkMode ? const Color(0xff06090d) : const Color(0xfff8f8f8),
                    //       //appbar bg color
                    //       leading: Padding(
                    //         padding: EdgeInsets.only(
                    //           left: size.width * 0.05,
                    //         ),
                    //         child: SizedBox(
                    //           height: size.width * 0.1,
                    //           width: size.width * 0.1,
                    //
                    //
                    //          child: Container(
                    //                 decoration: BoxDecoration(
                    //                   color: isDarkMode
                    //                       ? const Color(0xff070606)
                    //                       : Colors.white, //icon bg color
                    //                   borderRadius: const BorderRadius.all(
                    //                     Radius.circular(
                    //                       10,
                    //                     ),
                    //                   ),
                    //                 ),
                    //
                    //
                    //                   child: IconButton(
                    //
                    //
                    //
                    //                     icon:
                    //                     Icon(
                    //                       UniconsLine.bars,
                    //                       color: isDarkMode
                    //                           ? Colors.white
                    //                           : Colors.black, //icon bg color
                    //                       size: size.height * 0.025,
                    //                     ),
                    //             onPressed: ()=> Scaffold.of(context).openDrawer(),
                    //                   ),
                    //                 ),
                    //               ),
                    //        ),
                  )),

          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leadingWidth: size.width * 0.15,
          title: Text("DEALERSHIP",
              style: GoogleFonts.poppins(
                color: isDarkMode ? Colors.white : Colors.black,
                fontSize: size.width * 0.06,
                fontWeight: FontWeight.bold,
              )),

          // Image.asset(
          //   isDarkMode
          //       ? 'assets/icons/SobGOGlight.png'
          //       : 'assets/icons/SobGOGdark.png', //logo
          //   height: size.height * 0.06,
          //   width: size.width * 0.35,
          // ),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                right: size.width * 0.05,
              ),
              child: SizedBox(
                height: size.width * 0.1,
                width: size.width * 0.1,
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
                    UniconsLine.toggle_on,
                    color: isDarkMode ? Colors.white : Colors.black,
                    size: size.height * 0.025,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: buildBottomNavBar(1, size, isDarkMode),
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
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.04,
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: isDarkMode
                          ? const Color(0xff070606)
                          : Colors.white, //section bg color
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: size.height * 0.04,
                          ),
                        ),
                        //intro
                        Padding(
                          padding: EdgeInsets.only(
                            top: size.height * 0.01,
                          ),
                          child: Align(
                            child: Text(
                              'Choose from our fleet of New and Home-Used vehicles',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                color: isDarkMode ? Colors.white : Colors.black,
                                fontSize: size.width * 0.035,
                              ),
                            ),
                          ),
                        ),

                        //fleets
                        Container(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: size.height * 0.03,
                                  left: size.width * 0.04,
                                  bottom: size.height * 0.025,
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: size.width * 0.025,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(1),
                                child: CarouselSlider.builder(
                                  itemCount: imageListfleet.length,
                                  options: CarouselOptions(
                                    enlargeCenterPage: true,
                                    height: 230,
                                    autoPlay: true,
                                    autoPlayInterval: Duration(seconds: 3),
                                    reverse: false,
                                    aspectRatio: 5.0,
                                  ),
                                  itemBuilder: (context, i, id) {
                                    //for onTap to redirect to another screen

                                    return GestureDetector(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                              color: Colors.white,
                                            )),
                                        //ClipRRect for image border radius
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.asset(
                                            imageListfleet[i],
                                            width: 2700,
                                            //fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        var url = imageListfleet[i];
                                        print(url.toString());
                                      },
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        // MaterialPageRoute(builder: (_) => SignInScreen()),
                                        MaterialPageRoute(
                                            builder: (_) => Fleet()));
                                  },
                                  child: Text(
                                    "Fleet",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: size.width * 0.043,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            border: Border.all(
                              color: Colors.white12,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        ),

                        //Fleet
                      ],
                    ),
                  ),
                ),

                //RENTAL SLIDER
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.01,
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: isDarkMode
                          ? const Color(0xff070606)
                          : Colors.white, //section bg color
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: size.height * 0.04,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: size.height * 0.01,
                          ),
                          child: Align(
                            child: Text(
                              'Rent A Car now',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                color: isDarkMode ? Colors.white : Colors.black,
                                fontSize: size.width * 0.035,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: size.height * 0.03,
                            left: size.width * 0.04,
                            bottom: size.height * 0.025,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: size.width * 0.025,
                                ),
                                // child: Container(
                                //   height: size.height * 0.06,
                                //   width: size.width * 0.14,
                                //   decoration: const BoxDecoration(
                                //     borderRadius: BorderRadius.all(
                                //       Radius.circular(
                                //         10,
                                //       ),
                                //     ),
                                //     color: Colors.black, //filters bg color
                                //   ),
                                //   child: Icon(
                                //     UniconsLine.sliders_v,
                                //     color: Colors.white,
                                //     size: size.height * 0.032,
                                //   ),
                                // ),
                              ),
                            ],
                          ),
                        ),


                        Container(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(1),
                                child: CarouselSlider.builder(
                                  itemCount: imageListrental.length,
                                  options: CarouselOptions(
                                    enlargeCenterPage: true,
                                    height: 230,
                                    autoPlay: true,
                                    autoPlayInterval: Duration(seconds: 3),
                                    reverse: false,
                                    aspectRatio: 5.0,
                                  ),
                                  itemBuilder: (context, i, id) {
                                    //for onTap to redirect to another screen

                                    return GestureDetector(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            border: Border.all(
                                              color: Colors.white,
                                            )),
                                        //ClipRRect for image border radius
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Image.asset(
                                            imageListrental[i],
                                            width: 600,
                                            // fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        var url = imageListrental[i];
                                        print(url.toString());
                                      },
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      // MaterialPageRoute(builder: (_) => SignInScreen()),
                                        MaterialPageRoute(
                                            builder: (_) => RentalPage()));
                                  },
                                  child: Text(
                                    "Rentals",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      color: isDarkMode ? Colors.white : Colors.black,
                                      fontSize: size.width * 0.043,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                            border: Border.all(
                              color: Colors.white12,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset:
                                Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                // buildTopBrands(size, isDarkMode),
                // buildMostRented(size, isDarkMode),
                // buildFleets(size, isDarkMode),
              ],
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder textFieldBorder() {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.5),
        width: 1.0,
      ),
    );
  }

  void resetApp() {
    setState(() {
      drawerOpen = true;
    });
  }
}
