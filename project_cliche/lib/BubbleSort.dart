import 'package:flutter/material.dart';
import 'package:project_cliche/main.dart';
import 'ArrayCreator.dart';

//
//
//
class BubbleSort extends StatefulWidget {
  //
  //
  List<int> finalListOfNumbers;
  int finalTotalNumber;
  List<Container> finalListOfContainers;
  //
  //
  BubbleSort(List<int> numbers, int numberofelements,
      List<Container> listofcontainers) {
    finalListOfNumbers = numbers;
    finalTotalNumber = numberofelements;
  }
  //
  //
  @override
  _BubbleSortState createState() => _BubbleSortState();
}

//
//
class _BubbleSortState extends State<BubbleSort> with TickerProviderStateMixin {
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

  //
  //
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
        //
        await Future.delayed(Duration(milliseconds: (200 ~/ speedFactor)), () {
          setState(() {
            numberOfComparisons++;
            containerColourChanger(finalListOfContainers, j,
                finalListOfIntegers, sizeOfArray, Colors.cyanAccent);
          });
        });
        //
        //
        if (finalListOfIntegers[j] > finalListOfIntegers[j + 1]) {
          await Future.delayed(Duration(milliseconds: 200 ~/ speedFactor), () {
            setState(() {
              numberOfSwaps++;
              finalListOfContainers[j] = arrayCreator.createContainer(
                  finalListOfIntegers[j].toDouble(),
                  finalListOfIntegers.length,
                  Colors.redAccent);
              finalListOfContainers[j + 1] = arrayCreator.createContainer(
                  finalListOfIntegers[j + 1].toDouble(),
                  finalListOfIntegers.length,
                  Colors.redAccent);

              swapperBhai(j, finalListOfContainers, finalListOfIntegers);
            });
          });
          //
          //
        }
        await Future.delayed(Duration(milliseconds: 300 ~/ speedFactor), () {
          setState(() {
            containerColourChanger(finalListOfContainers, j,
                finalListOfIntegers, sizeOfArray, Colors.black);
          });
        });
        //
        //
      }
    }
  }

  //
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'Cliche Bubble Sorting Visualizer',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'BebasNeue',
              fontSize: 25),
        ),
      ),
      backgroundColor: Color(0xffC9CBCC),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      'Red Flash',
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'BebasNeue',
                          fontSize: 20),
                    ),
                    Text(
                      ' indicates a swapping action. ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'BebasNeue',
                          fontSize: 20),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 30,
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
                      width: 30,
                    ),
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
              flex: 20,
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
