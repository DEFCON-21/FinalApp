import 'package:flutter/material.dart';
import 'package:niggalations/models/quotes.dart';
import 'package:niggalations/models/global.dart';
import 'package:niggalations/screenwidgets/detail_header.dart';
import 'package:niggalations/screenwidgets/detail_content.dart';

class Quotedetail extends StatelessWidget {
  final Quote quote;

  Quotedetail({@required this.quote});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSilverColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                DetailHeader(quote: quote),
                DetailContent(quote: quote),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
