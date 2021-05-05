import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'ArrayVisualizer.dart';
import 'dart:math';

ArrayVisualizer av = new ArrayVisualizer();
void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    Random rng = new Random();
    Container createContainer(int q) {
      return Container(
        color: Color(0xff36454F),
        height: q.toDouble(),
        width: 2,
        child: Text(' '),
      );
    }

    List<Container> rows = [];
    List<Container> rowMaker(int z) {
      for (int l = 0; l < z; l++) {
        rows.add(
          createContainer((rng.nextInt(100) + 1) * 4),
        );
      }

      return rows;
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffD3D3D3),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: rowMaker(_currentSliderValue.toInt()),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Slider(
                      value: _currentSliderValue,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      }),
                ),
              ),
              Expanded(
                child: FloatingActionButton(
                  backgroundColor: Color(0xff40826D),
                  child: Icon(Icons.refresh_outlined),
                  onPressed: () {
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
