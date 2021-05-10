import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'ArrayCreator.dart';
import 'BubbleSort.dart';
import 'InsertionSort.dart';
import 'SelectionSort.dart';

List<int> finalArrayOfNumbers;
int finalTotalNumbers;
List<Container> finalListOfContainers = [];
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
  @override
  Widget build(BuildContext context) {
    //
    //
    //
    //
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/2': (context) => BubbleSort(
            finalArrayOfNumbers, finalTotalNumbers, finalListOfContainers),
        '/3': (context) => InsertionSort(
            finalArrayOfNumbers, finalTotalNumbers, finalListOfContainers),
        '/4': (context) => SelectionSort(
            finalArrayOfNumbers, finalTotalNumbers, finalListOfContainers)
      },
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    ArrayCreator arrayCreator = new ArrayCreator();
    List<Container> rows = arrayCreator.rowMaker(
      _currentSliderValue.toInt(),
    );
    finalArrayOfNumbers = arrayCreator.arrayOfNumbers;

    finalListOfContainers = rows;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'Cliche Array Sorting Visualizer',
          style: TextStyle(
              color: Color(0xff0F6A67),
              fontWeight: FontWeight.bold,
              fontFamily: 'BebasNeue',
              fontSize: 30),
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
            Text(
              'Create an array',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: 'BebasNeue'),
            ),
            Expanded(
              flex: 30,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: rows,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Slider(
                    activeColor: Color(0xff282828),
                    inactiveColor: Colors.blueGrey,
                    value: _currentSliderValue,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        finalTotalNumbers = value.toInt();
                        _currentSliderValue = value;
                      });
                    }),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                'Use the slider to change the number of elements',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'BebasNeue',
                    fontSize: 22),
              ),
            ),
            Expanded(
              flex: 2,
              child: FloatingActionButton(
                backgroundColor: Colors.black12,
                child: Icon(
                  Icons.refresh_outlined,
                  color: Color(0xff232e45),
                ),
                onPressed: () {
                  setState(() {});
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Hero(
                    tag: "sortButton",
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/2');
                        print(finalArrayOfNumbers);
                      },
                      child: Card(
                        elevation: 10,
                        child: Text(
                          'Bubble Sort',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'BebasNeue',
                              fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                  Hero(
                    tag: 'InsertionGraph',
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/3');
                        print(finalArrayOfNumbers);
                      },
                      child: Card(
                        elevation: 10,
                        child: Text(
                          'Insertion Sort',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'BebasNeue',
                              fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                  Hero(
                    tag: 'SelectionGraph',
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/4');
                        print(finalArrayOfNumbers);
                      },
                      child: Card(
                        elevation: 10,
                        child: Text(
                          'Selection Sort',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'BebasNeue',
                              fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
