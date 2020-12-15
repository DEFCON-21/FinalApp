import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:niggalations/models/quotes.dart';
import 'package:niggalations/models/global.dart';

class DetailHeader extends StatelessWidget {
  final Quote quote;

  DetailHeader({@required this.quote});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kSpacingUnit * 2,
        vertical: kSpacingUnit * 3,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              'assets/images/chevron_left_icon.svg',
              height: 40.sp,
              width: 40.sp,
            ),
          ),
          Text(
            'Read',
            style: kSubTitleTextStyle.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 30.sp),
        ],
      ),
    );
  }
}
