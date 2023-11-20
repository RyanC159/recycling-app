import 'package:flutter/material.dart';
import '../models/home.dart';
import '../styles.dart';

const HomeTileHeight = 100.0;

class HomeTile extends StatelessWidget {
  final Home home;
  final bool darkTheme;

  HomeTile({required this.home, required this.darkTheme});

  @override
  Widget build(BuildContext context) {
    final title = home.name!.toUpperCase();
    return Container(
      padding: EdgeInsets.all(0.0),
      height: HomeTileHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$title',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: this.darkTheme ? Styles.homeTileTitleDark : Styles.homeTileTitleLight),          
        ]),
    );
  }
}
