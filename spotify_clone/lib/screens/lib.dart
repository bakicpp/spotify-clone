import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  String qrResult = "Not yet scanned";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(),
    );
  }
}
