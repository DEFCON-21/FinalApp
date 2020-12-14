import 'package:flutter/material.dart';
import 'package:niggalations/models/global.dart';

class Subheader extends StatelessWidget {
  const Subheader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kSpacingUnit,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RichText(
              textAlign: TextAlign.end,
              text: TextSpan(style: kSubTitleTextStyle, children: [
                TextSpan(
                    text: '...Get Inspired today\n',
                    style: TextStyle(fontWeight: FontWeight.w300)),
                TextSpan(text: 'Straight from the Hood'),
              ]),
            ),
            SizedBox(
              width: kSpacingUnit,
            ),
            CircleAvatar(
              backgroundColor: kAccentColor,
              backgroundImage: AssetImage('assets/images/nigdp.jpg'),
            )
          ],
        ),
      ),
    );
  }
}
