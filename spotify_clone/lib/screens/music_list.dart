import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:spotify_clone/constants.dart';
import 'package:spotify_clone/dummy_data.dart';
import 'package:spotify_clone/widgets.dart';

class MusicList extends StatefulWidget {
  const MusicList({Key? key}) : super(key: key);

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  var photo = DummyData();

  play() {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(3),
      margin: EdgeInsets.all(5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      duration: Duration(minutes: 4),
      content: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(4, 4), blurRadius: 5)
              ],
              gradient: LinearGradient(colors: [
                Colors.black87,
                gr2,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          width: 100,
          height: 60,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Image.asset(
                  "images/another_love.jfif",
                  scale: 2,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Another Love • ",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              Text(
                "Tom Odell",
                style: GoogleFonts.openSans(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
              SizedBox(
                width: 110,
              ),
              Icon(
                Icons.pause,
                size: 30,
              ),
            ],
          )),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  late Color heartColor = Colors.white54;
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 400,
            floating: true,
            shadowColor: Colors.black,
            pinned: true,
            snap: true,
            elevation: 100,
            backgroundColor: Colors.black87,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Chill Hits",
                style: GoogleFonts.poppins(
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              centerTitle: true,
              background: Image.asset(
                "images/chill_hits_large.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white12, Colors.black54],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          "Kick back to the best new and recent chill hits.",
                          style: GoogleFonts.poppins(
                              fontSize: 13, color: Colors.white54),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8, top: 10),
                        child: Image.asset(
                          "images/spotifylogo.png",
                          scale: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, top: 10),
                        child: Text(
                          "Spotify",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          "7.422.951 beğenme • 6s 53d",
                          style: GoogleFonts.workSans(color: Colors.white54),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: LikeButton(
                          bubblesColor: BubblesColor(
                              dotPrimaryColor: green,
                              dotSecondaryColor: Colors.greenAccent,
                              dotLastColor: Colors.black,
                              dotThirdColor: Colors.lightGreen),
                          circleColor: CircleColor(
                              start: green, end: Colors.greenAccent),
                          size: 30,
                          likeBuilder: (isTapped) {
                            return isTapped
                                ? Icon(
                                    Icons.favorite,
                                    color: green,
                                    size: 30,
                                  )
                                : Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.white54,
                                    size: 30,
                                  );
                          },
                        ),
                      ),
                      IconButton(
                          onPressed: null,
                          icon: Icon(FontAwesomeIcons.circleArrowDown)),
                      IconButton(
                          onPressed: null,
                          icon: Icon(
                            FontAwesomeIcons.ellipsis,
                          )),
                      SizedBox(
                        width: 150,
                      ),
                      IconButton(
                          onPressed: null,
                          icon: Icon(FontAwesomeIcons.shuffle)),
                      SizedBox(
                        width: 10,
                      ),
                      FloatingActionButton.small(
                        onPressed: play,
                        backgroundColor: green,
                        child: Icon(
                          FontAwesomeIcons.play,
                          size: 20,
                          color: Colors.black87,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: play,
                    child: muzikgoster(
                        image: photo.another_love,
                        musicName: "Another Love",
                        artist: "Tom Odell",
                        artistPad: 260,
                        namePad: 230),
                  ),
                  muzikgoster(
                    image: photo.to_the_moon,
                    musicName: "TO THE MOON",
                    artist: "Jnr Choi",
                    artistPad: 270,
                    namePad: 220,
                  ),
                  muzikgoster(
                      image: photo.heat_waves,
                      musicName: "Heat Waves",
                      artist: " Glass Animals",
                      artistPad: 240,
                      namePad: 240),
                  muzikgoster(
                      image: photo.love_nwantity,
                      musicName: "love nwantity (ah ah ah)",
                      artist: "CKay                                        ",
                      artistPad: 160,
                      namePad: 160),
                  muzikgoster(
                      image: photo.bored,
                      musicName: "Bored",
                      artist: "Billie Eilish",
                      artistPad: 260,
                      namePad: 282),
                  muzikgoster(
                      image: photo.lie_to_me,
                      musicName: "lie to me",
                      artist: "Tate McRae, Ali Gatie",
                      artistPad: 200,
                      namePad: 265),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
