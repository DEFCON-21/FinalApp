import 'package:flutter/material.dart';

import 'package:niggalations/models/global.dart';
import 'package:niggalations/models/quotes.dart';

class Tags extends StatefulWidget {
  @override
  _TagsState createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  List<Widget> tagtile = [];
  @override
  void initState() {
    super.initState();
    addtags();
  }

  void addtags() {
    List<Tag> tags = [
      Tag('Short Verses'),
      Tag('Bible Chapters'),
      Tag('Motivation'),
      Tag('motivation'),
    ];

    tags.forEach((Tag tag) {
      tagtile.add(_buildTile(tag));
    });
  }

  Widget _buildTile(Tag tag) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(
          left: kSpacingUnit,
        ),
        height: kSpacingUnit * 4,
        width: kSpacingUnit * 12,
        decoration: BoxDecoration(
          color: kAccentColor,
          borderRadius: BorderRadius.circular(kSpacingUnit * 3),
        ),
        child: Center(
          child: Row(
            children: [
              SizedBox(width: kSpacingUnit),
              Text(
                tag.tag,
                style: kCaptionTextStyle.copyWith(
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
                size: 15,
              ),
              SizedBox(width: kSpacingUnit * 0.5),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: kSpacingUnit * 2),
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tagtile.length,
          itemBuilder: (context, index) {
            return tagtile[index];
          }),
    );
  }
}
