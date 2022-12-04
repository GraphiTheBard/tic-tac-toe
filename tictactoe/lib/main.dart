import 'dart:ffi';
//import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget his the root of your application.
  @override
  Widget build(BuildContext context) {
    // const color1 = const Color(0xFF1B1D1F);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1B1D1F),
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.grey.shade900, secondary: Colors.grey.shade900),
        primarySwatch: Colors.deepOrange,
      ),
      home: const MyHomePage(title: 'TIC-TAC-TOE'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var win = [
    ['-', '-', '-'],
    ['-', '-', '-'],
    ['-', '-', '-']
  ];

  int _counter = 0;
  bool px = false;
  bool px0 = false;
  bool px1 = false;
  bool px2 = false;
  bool px3 = false;
  bool px4 = false;
  bool px5 = false;
  bool px6 = false;
  bool px7 = false;
  bool px8 = false;

  String move = "X";
  String move0 = "X";
  String move1 = "X";
  String move2 = "X";
  String move3 = "X";
  String move4 = "X";
  String move5 = "X";
  String move6 = "X";
  String move7 = "X";
  String move8 = "X";

  bool reset0 = false;
  bool reset1 = false;
  bool reset2 = false;
  bool reset3 = false;
  bool reset4 = false;
  bool reset5 = false;
  bool reset6 = false;
  bool reset7 = false;
  bool reset8 = false;

  bool fin = false;

  var winner = 'n';
  var winn;

  void onReset() {
    setState(() {
      reset0 = true;
      reset1 = true;
      reset2 = true;
      reset3 = true;
      reset4 = true;
      reset5 = true;
      reset6 = true;
      reset7 = true;
      reset8 = true;

      px = false;
      px0 = false;
      px1 = false;
      px2 = false;
      px3 = false;
      px4 = false;
      px5 = false;
      px6 = false;
      px7 = false;
      px8 = false;

      winn = "";
      win = [
        ['-', '-', '-'],
        ['-', '-', '-'],
        ['-', '-', '-']
      ];
    });
  }

  void onWin() {
    px0 = true;
    px1 = true;
    px2 = true;
    px3 = true;
    px4 = true;
    px5 = true;
    px6 = true;
    px7 = true;
    px8 = true;
  }

//00 02 10 11 12 20
  bool checkWin(int a, int b, String val) {
    win[a][b] = val;
    print("a:$a b:$b char:$val");
    print(win);
    winner = 'n';
    var xwin = [0, 0, 0];
    var owin = [0, 0, 0];

    //row check
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (win[i][j] == 'X') {
          xwin[i]++;
          owin[i] = 0;
        }
        if (win[i][j] == 'O') {
          owin[i]++;

          xwin[i] = 0;
        }

        if (xwin[i] == 3) {
          winner = "x";
          break;
        }

        if (owin[i] == 3) {
          winner = "o";
          break;
        }
      }
    }

    //col check

    xwin = [0, 0, 0];
    owin = [0, 0, 0];

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (win[j][i] == 'X') {
          xwin[i]++;
          owin[i] = 0;
        }
        if (win[j][i] == 'O') {
          owin[i]++;

          xwin[i] = 0;
        }

        if (xwin[i] == 3) {
          winner = "x";
          break;
        }

        if (owin[i] == 3) {
          winner = "o";
          break;
        }
      }
    }

    //diagonal check
    xwin = [0, 0, 0];
    owin = [0, 0, 0];

    for (int i = 0; i < 3; i++) {
      if (win[i][i] == 'X') {
        xwin[1]++;
        owin[1] = 0;
        print(xwin);
      }
      if (win[i][i] == 'O') {
        owin[1]++;
        xwin[1] = 0;
      }

      if (xwin[1] == 3) {
        winner = "x";
        break;
      }

      if (owin[1] == 3) {
        winner = "o";
        break;
      }
    }

    for (int i = 0; i < 3; i++) {
      if (win[i][2 - i] == 'X') {
        xwin[2]++;
        owin[2] = 0;
        print(xwin);
      }
      if (win[i][2 - i] == 'O') {
        owin[2]++;
        xwin[2] = 0;
      }

      if (xwin[2] == 3) {
        winner = "x";
        break;
      }

      if (owin[2] == 3) {
        winner = "o";
        break;
      }
    }

    if (winner != 'n') {
      print("$winner WON !!!!!!!!!!");
      winn = winner;
      onWin();
      return true;
    }

    return false;
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('WINNER!!!'),
      content: new Column(
        // mainAxisAlignment: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Text("YOU WON!!!")],
      ),
      actions: <Widget>[
        new ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("close"),
        ),
      ],
    );
  }

//////////////////////
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.

          child: Container(
        child: Container(
          height: 400,
          width: 400,
          color: Color.fromARGB(40, 243, 242, 241),
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(7),
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: <Widget>[
              Container(
                child: ElevatedButton(
                    onPressed: px0
                        ? null
                        : () {
                            setState(() {
                              px = !px;
                              px0 = true;
                              reset0 = false;
                              move0 = px ? "X" : "O";
                            });
                            fin = checkWin(0, 0, move0);
                            ;
                          },
                    child: reset0
                        ? const Text("")
                        : Text(move0, style: const TextStyle(fontSize: 40))),
              ),
              Container(
                child: ElevatedButton(
                  child: reset1
                      ? Text("")
                      : Text("$move1", style: TextStyle(fontSize: 40)),
                  onPressed: px1
                      ? null
                      : () {
                          setState(() {
                            px = !px;
                            px1 = true;
                            reset1 = false;
                            move1 = px ? "X" : "O";
                            //switchMove();
                          });
                          fin = checkWin(0, 1, move1);
                        },
                ),
              ),
              Container(
                child: ElevatedButton(
                  child: reset2
                      ? Text("")
                      : Text("$move2", style: TextStyle(fontSize: 40)),
                  onPressed: px2
                      ? null
                      : () {
                          setState(() {
                            px2 = true;
                            px = !px;
                            reset2 = false;
                            move2 = px ? "X" : "O";
                          });
                          fin = checkWin(0, 2, move2);
                        },
                ),
              ),
              Container(
                child: ElevatedButton(
                  child: reset3
                      ? Text("")
                      : Text("$move3", style: TextStyle(fontSize: 40)),
                  onPressed: px3
                      ? null
                      : () {
                          setState(() {
                            px = !px;
                            px3 = true;
                            reset3 = false;
                            move3 = px ? "X" : "O";
                          });
                          fin = checkWin(1, 0, move3);
                        },
                ),
              ),
              Container(
                child: ElevatedButton(
                  child: reset4
                      ? Text("")
                      : Text("$move4", style: TextStyle(fontSize: 40)),
                  onPressed: px4
                      ? null
                      : () {
                          setState(() {
                            px = !px;
                            px4 = true;
                            reset4 = false;
                            move4 = px ? "X" : "O";
                          });
                          fin = checkWin(1, 1, move4);
                        },
                ),
              ),
              Container(
                child: ElevatedButton(
                  child: reset5
                      ? Text("")
                      : Text("$move5", style: TextStyle(fontSize: 40)),
                  onPressed: px5
                      ? null
                      : () {
                          setState(() {
                            px = !px;
                            px5 = true;
                            reset5 = false;
                            move5 = px ? "X" : "O";
                          });
                          fin = checkWin(1, 2, move5);
                        },
                ),
              ),
              Container(
                child: ElevatedButton(
                  child: reset6
                      ? Text("")
                      : Text("$move6", style: TextStyle(fontSize: 40)),
                  onPressed: px6
                      ? null
                      : () {
                          setState(() {
                            px = !px;
                            px6 = true;
                            reset6 = false;
                            move6 = px ? "X" : "O";
                          });
                          fin = checkWin(2, 0, move6);
                        },
                ),
              ),
              Container(
                child: ElevatedButton(
                  child: reset7
                      ? Text("")
                      : Text("$move7", style: TextStyle(fontSize: 40)),
                  onPressed: px7
                      ? null
                      : () {
                          setState(() {
                            px = !px;
                            px7 = true;
                            reset7 = false;
                            move7 = px ? "X" : "O";
                          });
                          fin = checkWin(2, 1, move7);
                        },
                ),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: px8
                      ? null
                      : () {
                          setState(() {
                            px = !px;
                            px8 = true;
                            reset8 = false;
                            move8 = px ? "X" : "O";
                          });
                          fin = checkWin(2, 2, move8);
                        },
                  child: reset8
                      ? const Text("")
                      : Text(move8, style: const TextStyle(fontSize: 40)),
                ),
              ),
            ],
          ),
        ),

        /////////////
      )),

      floatingActionButton: FloatingActionButton(
        onPressed: onReset,
        tooltip: 'Reset',
        child: const Icon(Icons.refresh),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
