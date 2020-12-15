import 'package:flutter/material.dart';
import 'package:niggalations/models/global.dart';
import 'package:niggalations/models/quotes.dart';
import 'package:share/share.dart';

class DetailFooter extends StatelessWidget {
  final Quote quote;
  DetailFooter({@required this.quote});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: EdgeInsets.all(kSpacingUnit * 2),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [kFooterShadow],
        ),
        child: Row(
          children: [
            Container(
              height: kSpacingUnit * 6,
              width: kSpacingUnit * 8,
              decoration: BoxDecoration(
                color: kSilverColor,
                borderRadius: BorderRadius.circular(kSpacingUnit * 3),
              ),
              child: Center(
                child: Icon(Icons.content_copy),
              ),
            ),
            SizedBox(width: kSpacingUnit * 2),
            Expanded(
              child: GestureDetector(
                onTap: () => share(context, quote),
                child: Container(
                  height: kSpacingUnit * 6,
                  decoration: BoxDecoration(
                    color: kAccentColor,
                    borderRadius: BorderRadius.circular(kSpacingUnit * 3),
                  ),
                  child: Center(
                    child: Text(
                      'Share',
                      style: kTitleTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  share(BuildContext context, Quote quote) {
    final RenderBox box = context.findRenderObject();

    Share.share(
        "${quote.quotation} \n \n#${quote.author} - ${quote.number}\nSent Via NiggalationsApp",
        subject: 'Read this ${quote.author} quote',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}
