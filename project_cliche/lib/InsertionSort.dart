import 'package:flutter/material.dart';
import 'package:project_cliche/main.dart';
import 'ArrayCreator.dart';

//
//
class InsertionSort extends StatefulWidget {
  //
  //
  List<int> finalListOfNumbers;
  int finalTotalNumber;
  List<Container> finalListOfContainers;

  //
  //
  InsertionSort(List<int> numbers, int numberofelements,
      List<Container> listofcontainers) {
    finalListOfNumbers = numbers;
    finalTotalNumber = numberofelements;
  }
  //
  //
  @override
  _InsertionSortState createState() => _InsertionSortState();
}

//
//
class _InsertionSortState extends State<InsertionSort>
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

  //
  //
  void sortTheArray(int sizeOfArray, List<int> finalListOfIntegers,
      finalListOfContainers, double speed) async {
    int i, key, j;
    for (i = 1; i < finalListOfIntegers.length; i++) {
      key = finalListOfIntegers[i];
      await Future.delayed(Duration(milliseconds: 100), () {
        setState(() {
          finalListOfContainers[i] = arrayCreator.createContainer(
              finalListOfIntegers[i].toDouble(),
              finalListOfIntegers.length,
              Colors.cyan);
        });
      });
      //
      //
      j = i - 1;
      if (j >= 0) {
        numberOfComparisons++;
        finalListOfContainers[j] = arrayCreator.createContainer(
            finalListOfIntegers[j].toDouble(),
            finalListOfIntegers.length,
            Colors.red);
      }
      /* Move elements of arr[0..i-1], that are
        greater than key, to one position ahead
        of their current position */
      while (j >= 0 && finalListOfIntegers[j] > key) {
        await Future.delayed(Duration(milliseconds: 100 ~/ speedFactor), () {
          setState(() {
            numberOfComparisons++;
            finalListOfContainers[j] = arrayCreator.createContainer(
                finalListOfIntegers[j].toDouble(),
                finalListOfIntegers.length,
                Colors.cyan);
            finalListOfContainers[j + 1] = arrayCreator.createContainer(
                finalListOfIntegers[j + 1].toDouble(),
                finalListOfIntegers.length,
                Colors.cyan);
          });
        });
        await Future.delayed(Duration(milliseconds: 100 ~/ speedFactor), () {
          setState(() {
            finalListOfContainers[j] = arrayCreator.createContainer(
                finalListOfIntegers[j].toDouble(),
                finalListOfIntegers.length,
                Colors.black);
            finalListOfContainers[j + 1] = arrayCreator.createContainer(
                finalListOfIntegers[j + 1].toDouble(),
                finalListOfIntegers.length,
                Colors.black);
          });
        });
        await Future.delayed(Duration(milliseconds: 100 ~/ speedFactor), () {
          setState(() {
            numberOfSwaps++;
            finalListOfIntegers[j + 1] = finalListOfIntegers[j];
            finalListOfContainers[j + 1] = arrayCreator.createContainer(
                finalListOfIntegers[j + 1].toDouble(),
                finalListOfIntegers.length,
                Colors.black);
            j = j - 1;
          });
        });
      }
      await Future.delayed(Duration(milliseconds: 100 ~/ speedFactor), () {
        setState(() {
          finalListOfIntegers[j + 1] = key;
          finalListOfContainers[j + 1] = arrayCreator.createContainer(
              key.toDouble(), finalListOfIntegers.length, Colors.black);
        });
      });
    }
    for (int v = 0; v < finalListOfIntegers.length; v++) {
      finalListOfContainers[v] = arrayCreator.createContainer(
          finalListOfIntegers[v].toDouble(),
          finalListOfIntegers.length,
          Colors.black);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'Cliche Insertion Sorting Visualizer',
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
                tag: "InsertionGraph",
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
    //
  }
}
