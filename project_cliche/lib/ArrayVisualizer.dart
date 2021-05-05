import 'package:flutter/material.dart';
import 'dart:math';

class ArrayVisualizer {
  Random rng = new Random();
  List<Container> rows;
  List<Container> rowMaker(int z) {
    for (int l = 0; l < z; l++) {
      rows.add(createContainer(5));
    }
    return rows;
  }

  // (rng.nextInt(100) + 1) != null) ? (rng.nextInt(100)) + 1 : 35
  Container createContainer(int q) {
    return Container(
      color: Colors.amberAccent,
      height: q.toDouble(),
      child: Text('$q'),
    );
  }
}
