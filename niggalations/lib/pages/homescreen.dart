import 'package:flutter/material.dart';

import 'package:niggalations/models/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:niggalations/screenwidgets/home_content.dart';
import 'package:niggalations/screenwidgets/home_subheader.dart';
import 'package:niggalations/screenwidgets/home_header.dart';
import 'package:niggalations/screenwidgets/tags.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: kSpacingUnit * 6),
            HomeHeader(),
            SizedBox(height: kSpacingUnit * 3),
            Subheader(),
            SizedBox(height: kSpacingUnit * 3),
            Tags(),
            SizedBox(height: kSpacingUnit * 3),
            HomeContent(),
          ],
        ),
      ),
    );
  }
}
