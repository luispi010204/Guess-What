import 'package:flutter/material.dart';
import 'package:guess_what/model/begriffe.dart';
import 'package:provider/provider.dart';
import 'package:guess_what/pages/spielpage.dart';
import 'package:guess_what/pages/startpage.dart';
import 'package:guess_what/pages/begriffmaintainancepage.dart';

void main() {
  Begriffe data = Begriffe();
  runApp(GuessApp(data));
}

class GuessApp extends StatelessWidget {
  final Begriffe data;

  const GuessApp(this.data, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Begriffe>(
      create: (_) => data,
      child: MaterialApp(
      title: 'Guess What?',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Startpage(),
      ),
    );
  }
}