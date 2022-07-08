import 'dart:async';
import 'package:flutter/material.dart';
import 'package:guess_what/pages/startpage.dart';
import 'package:guess_what/model/begriffe.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:better_sound_effect/better_sound_effect.dart';
//import 'package:tilt_action/tilt_action.dart'; //wäre die beste Lösung, geht aber nicht. (wahrscheinlich zu alt)

class SpielPage extends StatefulWidget {
  final Begriffe data;

  const SpielPage(this.data, {Key? key}) : super(key: key);

  @override
  State<SpielPage> createState() => _SpielPageState();
}

class _SpielPageState extends State<SpielPage> {
  final soundEffect = BetterSoundEffect();

  int? soundId1;
  int? soundId2;

  int _counter = -1;
  Timer? countdownTimer;
  Duration myDuration = Duration(days: 5);
  late StreamSubscription subscription;
  String neuerBegriff = "";
  int gekippt = 0;

  forceRedraw() {
    setState(() => {});
    if (gekippt == 1) {
      neuerBegriff = widget.data.getBegriffe;
      _counter++;
    }

    //print(_counter);
  }

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      soundId1 = await soundEffect.loadAssetAudioFile(
          "assets/sounds/Clock-Ticking-C-www.fesliyanstudios.com.mp3");
      soundId2 = await soundEffect
          .loadAssetAudioFile("assets/sounds/Nuclear-alarm-siren.mp3");
    });

    accelerometerEvents.listen((event) {
      if (event.x < 5 && event.z < 5) {
        print(event.x);
        print(_counter);
        gekippt = gekippt + 1;

        forceRedraw();
      }
      if (event.x > 5) {
        gekippt = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');

    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Center(
              child: Text(
                neuerBegriff,
                textScaleFactor: 4,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  width: 200,
                  height: 120,
                  color: Colors.lightBlue,
                  child: Text("Punkte: " + _counter.toString(),
                      textScaleFactor: 3),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  width: 200,
                  height: 120,
                  color: Colors.green,
                  child: Text("Zeit: $seconds", textScaleFactor: 3),
                ),
              ],
            ),
            Container(
              child: exitButton(context),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: ElevatedButton(
                    onPressed: startTimer,
                    child: Text(
                      'Start',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      if (countdownTimer == null || countdownTimer!.isActive) {
                        stopTimer();
                      }
                      dispose();
                    },
                    child: Text(
                      'Stop',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget exitButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return Startpage();
            }),
          );
        },
        child: const Text("Beenden", style: TextStyle(fontSize: 20)),
      ),
    );
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());

    if (soundId1 != null && soundId2 != null) {
      Timer(Duration(seconds: 65), () {
        stopTimer();
        setCountDown();
      });

      Timer(Duration(seconds: 60), () {
        soundEffect.play(soundId2!);
      });
      Timer(Duration(seconds: 6), () {
        soundEffect.play(soundId1!);

        Timer(Duration(seconds: 6), () {
          soundEffect.play(soundId1!);

          Timer(Duration(seconds: 6), () {
            soundEffect.play(soundId1!);

            Timer(Duration(seconds: 6), () {
              soundEffect.play(soundId1!);

              Timer(Duration(seconds: 6), () {
                soundEffect.play(soundId1!);

                Timer(Duration(seconds: 6), () {
                  soundEffect.play(soundId1!);

                  Timer(Duration(seconds: 6), () {
                    soundEffect.play(soundId1!);

                    Timer(Duration(seconds: 6), () {
                      soundEffect.play(soundId1!);

                      Timer(Duration(seconds: 6), () {
                        soundEffect.play(soundId1!);
                      });
                      soundEffect.play(soundId1!);
                    });
                    soundEffect.play(soundId1!);
                  });
                  soundEffect.play(soundId1!);
                });
                soundEffect.play(soundId1!);
              });
              soundEffect.play(soundId1!);
            });
            soundEffect.play(soundId1!);
          });
          soundEffect.play(soundId1!);
        });
        soundEffect.play(soundId1!);
      });
      soundEffect.play(soundId1!);
    }
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
    countdownTimer?.cancel();
  }

  void setCountDown() async {
    final reduceSecondsBy = 1;
    myDuration.inSeconds.remainder(60);
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void dispose() {
    if (soundId1 != null || soundId2 != null) {
      soundEffect.release(soundId1!);
      soundEffect.release(soundId2!);
    }
  }
}
