import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  String _input = '';
  double _result = 0;

  void valueResult(String text) {
    setState(() {
      _input += text;
    });
  }

  void addToSum() {
    setState(() {
      _result += double.parse(_input);
      _input = '';
    });
  }

  void addToCarp() {
    setState(() {
      if (_result == 0) {
        _result = double.parse(_input);
      } else {
        _result *= double.parse(_input);
      }
      _input = '';
    });
  }

  void addToBolme() {
    setState(() {
      if (_result == 0) {
        _result = double.parse(_input);
      } else {
        _result /= double.parse(_input);
      }
      _input = '';
    });
  }

  void addToCikarma() {
    setState(() {
      if (_result == 0) {
        _result = double.parse(_input);
      } else {
        _result -= double.parse(_input);
      }
      _input = '';
    });
  }

  void clear() {
    setState(() {
      _result = 0;
      _input = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text("$_result $_input", style: TextStyle(fontSize: 50)),
        ),
        backgroundColor: Colors.amber,
        toolbarHeight: 150.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: Card(
                      child: ElevatedButton(
                        onPressed: () {
                          clear();
                        },
                        child: Text("C",
                            style:
                                TextStyle(fontSize: 30, color: Colors.black)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: Card(
                      child: ElevatedButton(
                        onPressed: () {
                          addToBolme();
                        },
                        child: Text("/",
                            style:
                                TextStyle(fontSize: 30, color: Colors.black)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: Card(
                      child: ElevatedButton(
                        onPressed: () {
                          addToCarp();
                        },
                        child: Text("X",
                            style:
                                TextStyle(fontSize: 30, color: Colors.black)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: Card(
                      child: ElevatedButton(
                        onPressed: () {
                          addToCikarma();
                        },
                        child: Text("-",
                            style:
                                TextStyle(fontSize: 30, color: Colors.black)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: Card(
                      child: ElevatedButton(
                        onPressed: () {
                          addToSum();
                        },
                        child: Text("+",
                            style:
                                TextStyle(fontSize: 30, color: Colors.black)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton("7"),
                _buildButton("8"),
                _buildButton("9"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton("4"),
                _buildButton("5"),
                _buildButton("6"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton("1"),
                _buildButton("2"),
                _buildButton("3"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton("0"),
                _buildButton(","),
                _buildButton("="),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      onPressed: () {
        valueResult(text);
      },
      child: Text(
        text,
        style: TextStyle(fontSize: 50, color: Colors.black),
      ),
    );
  }
}
