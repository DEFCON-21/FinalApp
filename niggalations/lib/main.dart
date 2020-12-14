import 'package:flutter/material.dart';

import 'package:niggalations/pages/homescreen.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.purpleAccent),
      home: HomeScreen(),
    ));
