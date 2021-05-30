import 'package:flutter/material.dart';
import 'package:project_cliche/main.dart';
import 'ArrayCreator.dart';

//
//
class SelectionSort extends StatefulWidget {
  //
  //
  List<int> finalListOfNumbers;
  int finalTotalNumber;
  List<Container> finalListOfContainers;
  //
  //
  SelectionSort(List<int> numbers, int numberofelements,
      List<Container> listofcontainers) {
    finalListOfNumbers = numbers;
    finalTotalNumber = numberofelements;
  }
  //
  //
  @override
  _SelectionSortState createState() => _SelectionSortState();
}

//
//
class _SelectionSortState extends State<SelectionSort>
    with TickerProviderStateMixin {
  int numberOfComparisons = 0, numberOfSwaps = 0;
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

  // void swapperBhai(int index, List containers, List integers) {
  //   Container temp = finalListOfContainers[index];
  //   int temp1 = integers[index];
  //   //
  //   //
  //   integers[index] = integers[index + 1];
  //   integers[index + 1] = temp1;
  //   //
  //   //
  //   containers[index] = containers[index + 1];
  //   containers[index + 1] = temp;
  // }

  //
  //
  void sortTheArray(int sizeOfArray, List<int> finalListOfIntegers,
      finalListOfContainers, double speed) async {
    int minimum;
    // reduces the effective size of the array by one in  each iteration.
    for (int i = 0; i < finalListOfIntegers.length - 1; i++) {
      // assuming the first element to be the minimum of the unsorted array .
      minimum = i;
      // gives the effective size of the unsorted  array .
      for (int j = i + 1; j < finalListOfIntegers.length; j++) {
        await Future.delayed(Duration(milliseconds: 100 ~/ speedFactor), () {
          setState(() {
            numberOfComparisons++;
            finalListOfContainers[minimum] = arrayCreator.createContainer(
                finalListOfIntegers[j].toDouble(),
                finalListOfIntegers.length,
                Colors.greenAccent);
          });
        });
        if (finalListOfIntegers[j] < finalListOfIntegers[minimum]) {
          //finds the minimum element
          minimum = j;
        }
        await Future.delayed(Duration(milliseconds: 100 ~/ speedFactor), () {
          setState(() {
            finalListOfContainers[minimum] = arrayCreator.createContainer(
                finalListOfIntegers[j].toDouble(),
                finalListOfIntegers.length,
                Colors.greenAccent);
          });
        });
      }
      // putting minimum element on its proper position.
      // swap(A[minimum], A[i]);
      await Future.delayed(Duration(milliseconds: 100 ~/ speedFactor), () {
        setState(() {
          numberOfSwaps++;
          int tempInteger = finalListOfIntegers[minimum];
          finalListOfIntegers[minimum] = finalListOfIntegers[i];
          finalListOfIntegers[i] = tempInteger;
          finalListOfContainers[minimum] = arrayCreator.createContainer(
              finalListOfIntegers[minimum].toDouble(),
              finalListOfIntegers.length,
              Colors.redAccent);

          finalListOfContainers[i] = arrayCreator.createContainer(
              finalListOfIntegers[i].toDouble(),
              finalListOfIntegers.length,
              Colors.greenAccent);
        });
      });
    }

    await Future.delayed(
      Duration(milliseconds: 100 ~/ speedFactor),
      () {
        setState(
          () {
            for (int f = 0; f < finalListOfIntegers.length; f++) {
              finalListOfContainers[minimum] = arrayCreator.createContainer(
                  finalListOfIntegers[minimum].toDouble(),
                  finalListOfIntegers.length,
                  Colors.black);
              finalListOfContainers[f] = arrayCreator.createContainer(
                  finalListOfIntegers[f].toDouble(),
                  finalListOfIntegers.length,
                  Colors.black);
              finalListOfContainers[minimum] = arrayCreator.createContainer(
                  finalListOfIntegers[minimum].toDouble(),
                  finalListOfIntegers.length,
                  Colors.black);
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(
          'Cliche Selection Sorting Visualizer',
          style: TextStyle(
              color: Color(0xff216869),
              fontWeight: FontWeight.bold,
              fontFamily: 'BebasNeue',
              fontSize: 25),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
              ),
            ),
            Column(
              children: [
                Text(
                  'Lezgo!!!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BebasNeue',
                      fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Red Flash ',
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'BebasNeue',
                          fontSize: 20),
                    ),
                    Text(
                      ' indicates the maximum element at that instant. ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'BebasNeue',
                          fontSize: 20),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Cyan Flash',
                      style: TextStyle(
                          color: Colors.cyanAccent,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'BebasNeue',
                          fontSize: 20),
                    ),
                    Text(
                      ' indicates elements which are compared. ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'BebasNeue',
                          fontSize: 20),
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Number of comparisons :  $numberOfComparisons',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BebasNeue',
                      fontSize: 22),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Number of swaps : $numberOfSwaps',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BebasNeue',
                      fontSize: 22),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                height: 40,
              ),
            ),
            Expanded(
              flex: 30,
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
              flex: 2,
              child: Text(
                'Use the slider to change the speed of sorting',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'BebasNeue',
                    fontSize: 22),
              ),
            ),
            Expanded(
              flex: 6,
              child: Hero(
                tag: "SelectionGraph",
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
                    margin: EdgeInsets.all(10),
                    elevation: 10,
                    child: Text(
                      'Sort',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'BebasNeue',
                          fontSize: 50),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
