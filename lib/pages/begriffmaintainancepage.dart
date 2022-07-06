import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/begriffe.dart';

class BegriffMaintainancePage extends StatefulWidget {
  @override
  State<BegriffMaintainancePage> createState() =>
      _BegriffMaintainancePageState();
}

class _BegriffMaintainancePageState extends State<BegriffMaintainancePage> {
  final myTextController = TextEditingController();

  @override
  void dispose() {
    myTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var begriffe = Provider.of<Begriffe>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Liste der Begriffe"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: begriffList(context)),
            begriffForm(context)
          ],
        ),
      ),
    );
  }

  Widget begriffList(BuildContext context) {
    var begriffe = Provider.of<Begriffe>(context);
    return ListView.builder(
        itemCount: begriffe.getListeBegriffe.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            title: Text(begriffe.getListeBegriffe[index]),
          ));
        });
  }

  Widget begriffForm(BuildContext context) {
    var begriffe = Provider.of<Begriffe>(context);

    return Column(
      children: [
         TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Hier eingeben:",
          ),
           controller: myTextController,
        ),
        ElevatedButton(
          onPressed: () {
            if (myTextController.text.isNotEmpty) {
              begriffe.add(myTextController.text);
              myTextController.clear();
            }
          },
          child: Text("hinzufügen"),
        )
      ],
    );
  }
}
