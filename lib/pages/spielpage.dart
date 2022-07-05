import 'package:guess_what/pages/begriffmaintainancepage.dart';
import 'package:guess_what/pages/spielpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:guess_what/model/begriffe.dart';


class SpielPage extends StatefulWidget {
  final Begriffe data;
  const SpielPage(this.data, {Key? key}) : super(key: key);


  @override
  State<SpielPage> createState() => _SpielPageState();
}

class _SpielPageState extends State<SpielPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var begriffe = Provider.of<Begriffe>(context);
    String neuerBegriff = begriffe.getBegriffe;
    return Scaffold(
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}