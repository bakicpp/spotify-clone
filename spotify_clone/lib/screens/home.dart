import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_clone/dummy_data.dart';
import 'package:spotify_clone/screens/lib.dart';
import 'package:spotify_clone/screens/search.dart';
import 'package:spotify_clone/widgets.dart';

import 'music_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;
  final List screens = [
    MainPage(),
    Search(),
    Library(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: Colors.white),
        selectedItemColor: Colors.white,
        elevation: 18,
        backgroundColor: Colors.black87,
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(label: 'Ana Sayfa', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Arama', icon: Icon(Icons.search)),
          BottomNavigationBarItem(
              label: 'Kitaplığın', icon: Icon(Icons.my_library_music)),
        ],
      ),
      body: screens[_currentIndex],
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var photo = new DummyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 7,
          title: Text(
            "Günaydın",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 28),
          ),
          backgroundColor: Colors.black87,
          actions: [
            Icon(
              Icons.notifications_none_outlined,
              size: 30,
            ),
            SizedBox(
              width: 15,
            ),
            Icon(Icons.av_timer_rounded, size: 30),
            SizedBox(
              width: 15,
            ),
            Icon(Icons.settings, size: 30),
            SizedBox(
              width: 15,
            ),
          ],
        ),
        body: Container(
            color: Colors.black87,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        MusicCard(
                          image: photo.another_love,
                          label: "Another Love",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MusicCard(
                            image: photo.chill_hits, label: "Chill Hits 2022"),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        MusicCard(
                            image: photo.mutlu_turkce_sarkilar,
                            label: "Mutlu Türkçe\nŞarkılar"),
                        SizedBox(
                          width: 10,
                        ),
                        MusicCard(image: photo.trend, label: "trend"),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        MusicCard(image: photo.nkvt, label: "NKVT"),
                        SizedBox(
                          width: 10,
                        ),
                        MusicCard(
                            image: photo.hayko, label: "Hayko Cepkin\nMix"),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "En çok dinlediğin mix'ler",
                      style: GoogleFonts.rubik(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    showMixList(),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white10,
                          backgroundImage: AssetImage("images/blaze.jfif"),
                          radius: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          children: [
                            Text(
                              "ile benzer diğer müzikler",
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: Colors.white54),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 40),
                              child: Text(
                                "The Blaze",
                                style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    showMixList2(),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            )));
  }
}
