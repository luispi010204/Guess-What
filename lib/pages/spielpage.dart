import 'dart:async';

import 'package:guess_what/pages/begriffmaintainancepage.dart';
import 'package:guess_what/pages/spielpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:guess_what/model/begriffe.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shake/shake.dart';


class SpielPage extends StatefulWidget {
  final Begriffe data;
  const SpielPage(this.data, {Key? key}) : super(key: key);

  @override
  State<SpielPage> createState() => _SpielPageState();
}



class _SpielPageState extends State<SpielPage> {
  int _counter = 0;
  double _x = 0, _y = 0, _z = 0;
  late StreamSubscription subscription;
  String neuerBegriff = "";

  forceRedraw() {
    setState(() => {});
    neuerBegriff = widget.data.getBegriffe;
    _counter++;
    print(_counter);
  }


  @override
  void initState() {
    super.initState();
    neuerBegriff = widget.data.getBegriffe;
    ShakeDetector.autoStart(
        onPhoneShake: forceRedraw
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(child: Text(neuerBegriff, textScaleFactor: 5,
        ),
      ),
    );
  }
}
