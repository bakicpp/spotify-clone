import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_clone/dummy_data.dart';
import 'package:spotify_clone/screens/music_list.dart';

class MusicCard extends StatefulWidget {
  final AssetImage image;
  final String? label;
  const MusicCard({
    Key? key,
    required this.image,
    required this.label,
  }) : super(key: key);

  @override
  State<MusicCard> createState() => _MusicCardState();
}

class _MusicCardState extends State<MusicCard> {
  card() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MusicList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: card,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(4),
            ),
            width: 200,
            height: 65,
            clipBehavior: Clip.antiAlias,
            child: Row(
              children: [
                Image(
                  image: widget.image,
                  height: 65,
                  width: 65,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  widget.label.toString(),
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class showMixList extends StatelessWidget {
  List musicDesc = ["Sakin Mix", "Hayko Cepkin Mix", "Rock Mix"];

  List musicPhoto = [
    "images/sakin_mix.jfif",
    "images/hayko.jfif",
    "images/rock_mix.jfif",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 226,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          primary: false,
          itemCount: musicDesc.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 180,
                  width: 180,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white10,
                  ),
                  child: Image(
                    image: AssetImage(musicPhoto[index]),
                    width: 180,
                    height: 180,
                  ),
                ),
                Text(
                  musicDesc[index],
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, color: Colors.white70),
                  textAlign: TextAlign.left,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class buildMusics extends StatefulWidget {
  const buildMusics({
    Key? key,
    required this.image,
    required this.musicName,
    required this.artist,
  }) : super(key: key);
  final AssetImage image;
  final String musicName;
  final String artist;

  @override
  State<buildMusics> createState() => _buildMusicsState();
}

class _buildMusicsState extends State<buildMusics> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 60,
      color: Colors.transparent,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: widget.image,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                widget.musicName,
                style: GoogleFonts.poppins(fontSize: 17, color: Colors.white),
              ),
              Text(
                widget.artist,
                textAlign: TextAlign.left,
                style:
                    GoogleFonts.workSans(fontSize: 13, color: Colors.white54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        hintText: "Ne dinlemek istiyorsun?",
        hintStyle: GoogleFonts.poppins(color: Colors.black87, fontSize: 17),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black87,
          size: 35,
        ),
      ),
    );
  }
}

class SearchCard extends StatelessWidget {
  final AssetImage image;
  const SearchCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(4),
        ),
        width: 200,
        height: 30,
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Image(
              image: image,
              height: 30,
              width: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }
}

class muzikgoster extends StatefulWidget {
  const muzikgoster({
    Key? key,
    required this.image,
    required this.musicName,
    required this.artist,
    required this.artistPad,
    required this.namePad,
  }) : super(key: key);
  final AssetImage image;
  final String musicName;
  final String artist;
  final double namePad;
  //şarkı adı padding değeri
  final double artistPad;
  //sanatçı adı padding değeri

  @override
  State<muzikgoster> createState() => _muzikgosterState();
}

class _muzikgosterState extends State<muzikgoster> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(
            image: widget.image,
            width: 48,
            height: 48,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: widget.namePad),
              child: Text(
                widget.musicName,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: widget.artistPad,
              ),
              child: Text(
                widget.artist,
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 3),
          child: Icon(
            FontAwesomeIcons.ellipsis,
            size: 16,
          ),
        ),
      ],
    );
  }
}

class showMixList2 extends StatelessWidget {
  List musicDesc = ["lie to me", "Bored", "Heat Waves"];

  List musicPhoto = [
    "images/lie_to_me.jfif",
    "images/bored.jfif",
    "images/heat_waves.jfif",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 226,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          primary: false,
          itemCount: musicDesc.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 180,
                  width: 180,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white10,
                  ),
                  child: Image(
                    image: AssetImage(musicPhoto[index]),
                    width: 180,
                    height: 180,
                  ),
                ),
                Text(
                  musicDesc[index],
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, color: Colors.white70),
                  textAlign: TextAlign.left,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
