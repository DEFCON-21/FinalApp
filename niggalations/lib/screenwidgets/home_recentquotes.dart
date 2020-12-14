import 'package:flutter/material.dart';
import 'package:niggalations/pages/quotecard.dart';

class RecentQuotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[Quotecard()],
    ));
  }
}
