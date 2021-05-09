import 'package:flutter/material.dart';
import 'package:project_cliche/main.dart';
import 'ArrayCreator.dart';
import 'package:intl/intl.dart';

//
//
class SortingScreen extends StatefulWidget {
  //
  //
  //
  //
  List<int> finalListOfNumbers;
  int finalTotalNumber;
  List<Container> finalListOfContainers;
  //
  //
  //
  //
  SortingScreen(List<int> numbers, int numberofelements,
      List<Container> listofcontainers) {
    finalListOfNumbers = numbers;
    finalTotalNumber = numberofelements;
  }
  //
  //
  //
  //
  @override
  _SortingScreenState createState() => _SortingScreenState();
}

//
//
//
//
class _SortingScreenState extends State<SortingScreen>
    with TickerProviderStateMixin {
  double currentSliderValue = 2;
  double speedFactor = 2;
  bool isPressedOnce = false;
  //
  //
  ArrayCreator arrayCreator = ArrayCreator();
  //
  //
  void containerColourChanger(List<Container> listOfContainersForColour, int t,
      List<int> listOfIntegers, int numberOfElements, Color clr) {
    listOfContainersForColour[t] = arrayCreator.createContainer(
        listOfIntegers[t].toDouble(), numberOfElements, clr);
    listOfContainersForColour[t + 1] = arrayCreator.createContainer(
        listOfIntegers[t + 1].toDouble(), numberOfElements, clr);
  }

  void swapperBhai(int index, List containers, List integers) {
    Container temp = finalListOfContainers[index];
    int temp1 = integers[index];
    //
    //

    integers[index] = integers[index + 1];
    integers[index + 1] = temp1;
    //
    //
    containers[index] = containers[index + 1];
    containers[index + 1] = temp;
  }

  //
  //
  void sortTheArray(int sizeOfArray, List<int> finalListOfIntegers,
      finalListOfContainers, double speed) async {
    //
    //
    for (int y = 0; y < finalListOfIntegers.length - 1; y++) {
      //
      //
      for (int j = 0; j < finalListOfIntegers.length - y - 1; j++) {
        //
        await Future.delayed(Duration(milliseconds: (100 ~/ speedFactor)), () {
          setState(() {
            containerColourChanger(finalListOfContainers, j,
                finalListOfIntegers, sizeOfArray, Colors.cyan);
          });
        });

        //
        //
        if (finalListOfIntegers[j] > finalListOfIntegers[j + 1]) {
          await Future.delayed(Duration(milliseconds: 200 ~/ speedFactor), () {
            setState(() {
              swapperBhai(j, finalListOfContainers, finalListOfIntegers);
            });
          });

          //
          //
          //
          //

        }
        await Future.delayed(Duration(milliseconds: 400 ~/ speedFactor), () {
          setState(() {
            containerColourChanger(finalListOfContainers, j,
                finalListOfIntegers, sizeOfArray, Color(0xffe50914));
          });
        });

        //
        //
      }
    }
  }

  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'Cliche Array Sorting Visualizer',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Color(0xffC9CBCC),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: SizedBox(
                height: 10,
              ),
            ),
            Expanded(
              flex: 25,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: finalListOfContainers,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Slider(
                    activeColor: Color(0xff282828),
                    inactiveColor: Colors.blueGrey,
                    value: currentSliderValue,
                    min: 1,
                    max: 300,
                    divisions: 300,
                    label: currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        speedFactor = value;
                        currentSliderValue = value;
                      });
                    }),
              ),
            ),
            Expanded(
              flex: 6,
              child: Hero(
                tag: "sortButton",
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      if (!isPressedOnce) {
                        sortTheArray(finalTotalNumbers, finalArrayOfNumbers,
                            finalListOfContainers, speedFactor);
                      }
                      isPressedOnce = true;
                    });
                  },
                  child: Card(
                    elevation: 10,
                    child: Text(
                      'Sort',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    //
  }
}
