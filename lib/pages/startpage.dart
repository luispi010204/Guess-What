import 'package:guess_what/pages/begriffmaintainancepage.dart';
import 'package:guess_what/pages/spielpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/begriffe.dart';

/**
 * Dieses ist die Spielseite. Hier wurde die ganze Logik hinter dem Spiel implementiert.
 */

class Startpage extends StatefulWidget {


  @override
  _StartPageState createState() => _StartPageState();

}


class _StartPageState extends State<Startpage>{


  @override
  Widget build(BuildContext context) {
    var begriffe = Provider.of<Begriffe>(context);

    
    return Scaffold(
      appBar: AppBar(
        title: Text("Guess What?"),
      ),
      body: Container(
        padding: EdgeInsets.all(100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(350, 70),
                  maximumSize: const Size(350, 70),
                  primary: Colors.green,

                ),
                onPressed: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) {
              return SpielPage(begriffe);
            }),
            );
            } , child: Text("Spielen")),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(350, 70),
                  maximumSize: const Size(350, 70),
                  primary: Colors.green,

                ),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return BegriffMaintainancePage();
                    }),
                  );
                } , child: Text("Begriffe"))
            
          ],
        ),
      ),
    );
        
        
  }
  

  
  
}