import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'package:niggalations/models/quotes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:niggalations/pages/quotedetail.dart';
import 'package:niggalations/models/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Quotecard extends StatefulWidget {
  @override
  _QuotecardState createState() => _QuotecardState();
}

class _QuotecardState extends State<Quotecard> {
  final String url =
      "https://raw.githubusercontent.com/DEFCON-21/nigga_quotes/main/quotes.json";
  List<Widget> quoteTiles = [];
  final GlobalKey listKey = GlobalKey();
  List<Quote> quotes = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var response = await http.get(url, headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      String responeBody = response.body;
      var jsonBody = json.decode(responeBody);
      for (var data in jsonBody) {
        quotes
            .add(new Quote(data['quotation'], data['author'], data['number']));
      }
      setState(() {});
      print('success');
    } else {
      var errorcode = 'Nigga Check Yo Inanet';
      print(errorcode);
    }

    quotes.forEach((Quote quote) {
      quoteTiles.add(buildTile(quote));
    });
  }

  Widget buildTile(Quote quote) {
    return Container(
      height: 180.w,
      margin: EdgeInsets.symmetric(vertical: kSpacingUnit),
      decoration: BoxDecoration(
        boxShadow: [kCardShadow],
      ),
      child: OpenContainer(
        transitionType: ContainerTransitionType.fadeThrough,
        transitionDuration: const Duration(milliseconds: 400),
        openColor: kSilverColor,
        openElevation: 0,
        openBuilder: (context, action) {
          return Quotedetail(quote: quote);
        },
        closedColor: Colors.transparent,
        closedElevation: 0,
        closedBuilder: (context, action) {
          return Container(
            padding: EdgeInsets.all(kSpacingUnit * 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(kSpacingUnit * 3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/nigdp.jpg'),
                    ),
                    SizedBox(width: kSpacingUnit),
                    Text(
                      quote.author,
                      style: kCardTitleTextStyle,
                    ),
                    const Spacer(),
                    Icon(Icons.keyboard_arrow_right, color: Colors.grey)
                  ],
                ),
                SizedBox(height: kSpacingUnit * 2),
                Text(
                  quote.quotation,
                  style: kSubTitleTextStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: false,
                ),
                Divider(height: kSpacingUnit * 2),
                Text(
                  quote.author + ' - ' + quote.number,
                  style: kCaptionTextStyle,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  //       child: Column(
  //         children: <Widget>[
  //           Row(
  //             children: <Widget>[
  //               Icon(MdiIcons.read),
  //               Text(quote.author + ' - ' + quote.number),
  //               Divider(
  //                 height: 10,
  //               ),
  //               Container(
  //                 width: MediaQuery.of(context).size.width,
  //                 height: 100,
  //                 child: Text(
  //                   quote.quotation,
  //                   overflow: TextOverflow.ellipsis,
  //                   softWrap: false,
  //                   maxLines: 3,
  //                 ),
  //               )
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.symmetric(
              horizontal: kSpacingUnit * 3,
            ).copyWith(
              top: kSpacingUnit * 2,
              bottom: kSpacingUnit * 2,
            ),
            child: quotes.length == 0
                ? Center(
                    child: Text('Hoolup Nigga...'),
                  )
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    key: listKey,
                    itemCount: quoteTiles.length,
                    itemBuilder: (context, index) {
                      return quoteTiles[index];
                    }),
          ),
        ],
      ),
    );
  }
}
