// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'ArrayCreator.dart';
//
// class SortAnimation {
//   ArrayCreator arrayCreator = ArrayCreator();
//
//   void containerColourChanger(List<Container> listOfContainersForColour, int t,
//       List<int> listOfIntegers, int numberOfElements, Color clr) {
//     listOfContainersForColour[t] =
//         arrayCreator.createContainer(listOfIntegers[t], numberOfElements, clr);
//     listOfContainersForColour[t + 1] = arrayCreator.createContainer(
//         listOfIntegers[t + 1], numberOfElements, clr);
//   }
//
//   void sortTheArray(
//       int sizeOfArray, List<int> finalListOfIntegers, finalListOfContainers,
//       {AnimationController controllerF, AnimationController controllerB}) {
//     //
//     //
//     for (int y = 0; y < sizeOfArray - 1; y++) {
//       //
//       //
//       for (int j = 0; j < sizeOfArray - y - 1; j++) {
//         //
//         //
//         containerColourChanger(finalListOfContainers, j, finalListOfIntegers,
//             sizeOfArray, Colors.cyan);
//         //
//         //
//         if (finalListOfIntegers[j] > finalListOfIntegers[j + 1]) {
//           AnimationController controllerForward;
//           AnimationController controllerBackwards;
//           //
//           //
//           controllerForward =
//               AnimationController(vsync: this,duration: Duration(milliseconds: 500));
//           controllerBackwards =
//               AnimationController(duration: Duration(milliseconds: 500));
//
//           controllerForward.forward();
//           controllerBackwards.reverse(from: 1);
//           controllerForward.addListener(() {
//             print(controllerForward.value);
//           });
//           controllerBackwards.addListener(() {
//             print("backwards ${controllerBackwards.value}");
//           });
//
//           //
//           //
//           Container temp = finalListOfContainers[j];
//           int temp1 = finalListOfIntegers[j];
//           //
//           //
//           finalListOfIntegers[j] = finalListOfIntegers[j + 1];
//           finalListOfIntegers[j + 1] = temp1;
//           //
//           //
//           finalListOfContainers[j] = finalListOfContainers[j + 1];
//           finalListOfContainers[j + 1] = temp;
//           //
//           //
//         }
//         containerColourChanger(finalListOfContainers, j, finalListOfIntegers,
//             sizeOfArray, Color(0xffe50914));
//       }
//
//       //
//
//       //
//
//     }
//   }
// }
