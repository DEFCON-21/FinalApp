import 'package:flutter/material.dart';
import 'package:niggalations/models/quotes.dart';
import 'package:niggalations/models/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailContent extends StatelessWidget {
  final Quote quote;

  DetailContent({@required this.quote});
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: 300,
        padding: EdgeInsets.symmetric(
          horizontal: kSpacingUnit * 4,
          vertical: kSpacingUnit * 4,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(kSpacingUnit * 5),
            topRight: Radius.circular(kSpacingUnit * 5),
            bottomLeft: Radius.circular(kSpacingUnit * 5),
            bottomRight: Radius.circular(kSpacingUnit * 5),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: kSpacingUnit * 5),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/nigdp.jpg'),
                    ),
                    SizedBox(height: kSpacingUnit * 2),
                    Text(
                      quote.author,
                      style: kTitleTextStyle,
                    ),
                    SizedBox(height: kSpacingUnit),
                    Text(
                      'Chapter - ' + quote.number,
                      style: kCaptionTextStyle.copyWith(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: kSpacingUnit * 5),
              Text(
                quote.quotation,
                style: kTitleTextStyle,
              ),
              SizedBox(height: kSpacingUnit * 10),
            ],
          ),
        ),
      ),
    );
  }
}
