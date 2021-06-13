import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(Dice());

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int letfDice = 1;
  int rightDice = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.redAccent,
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            title: Text('Dice Game'),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Row(
                    children: [
                      Expanded(child: Image.asset('image/dice$letfDice.png')),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(child: Image.asset('image/dice$rightDice.png'))
                    ],
                  ),
                ),
                SizedBox(
                  height: 60.0,
                ),
                ButtonTheme(
                  minWidth: 100.0,
                  height: 60.0,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        letfDice = Random().nextInt(6) + 1;
                        rightDice = Random().nextInt(6) + 1;
                      });
                      showToast(
                          'LeftDice : ${letfDice} , RightDice : ${rightDice}');
                    },
                    child: Icon(
                      Icons.play_arrow,
                      size: 50.0,
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange)),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM);
}
