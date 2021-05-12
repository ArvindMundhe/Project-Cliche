import 'package:flutter/material.dart';
import 'dart:math';

//
//
//
//
//
//
class ArrayCreator {
  Random rng = new Random();
  List<Container> rows = [];
  List<int> arrayOfNumbers = [];
  //
  //
  //
  //
  //
  //
  //
  List<Container> rowMaker(int z) {
    for (int l = 0; l < z; l++) {
      arrayOfNumbers.add(rng.nextInt(100) + 1);
      rows.add(
          createContainer((arrayOfNumbers[l]).toDouble(), z, Colors.black));
    }
    return rows;
  }

//
//
//
//
//
//
  Container createContainer(double heightOfBar, int numberOfBars, Color clr) {
    return Container(
      color: clr,
      height: heightOfBar * 4,
      width: 300 / numberOfBars,
      child: Text(' '),
    );
  }
}
