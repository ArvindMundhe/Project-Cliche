import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'ArrayCreator.dart';
import 'SortingScreen.dart';

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
    // .
    // .
    // .
    // .

    // List<Container> rows = [];
    // List<Container> rowMaker(int z) {
    //   for (int l = 0; l < z; l++) {
    //     rows.add(
    //       av.createContainer((random.nextInt(100) + 1) * 4),
    //     );
    //   }
    //
    //   return rows;
    // }

    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/2': (context) => SortingScreen(
            finalArrayOfNumbers, finalTotalNumbers, finalListOfContainers),
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
              flex: 20,
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
              flex: 1,
              child: FloatingActionButton(
                backgroundColor: Color(0xff282828),
                child: Icon(Icons.refresh_outlined),
                onPressed: () {
                  setState(() {});
                },
              ),
            ),
            Expanded(
              flex: 3,
              child: Hero(
                tag: "sortButton",
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/2');
                    print(finalArrayOfNumbers);
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
  }
}
