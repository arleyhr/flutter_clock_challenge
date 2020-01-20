import 'package:flutter/material.dart';

import 'board.dart';
import 'config.dart';

Widget horizontalLBlocks = Positioned(
  width: 60,
  left: 0,
  bottom: 0,
  child: Board(
    coords: hLBlocks,
    size: 60,
    numOfHorizontalSqrs: 3,
    numOfVerticalSqrs: 2,
    square: (index) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.blueAccent, borderRadius: BorderRadius.circular(4)),
      );
    },
  ),
);

Widget verticalFigureBlocks = Positioned(
  width: 40,
  left: 40,
  bottom: 0,
  child: Board(
    coords: figureBlocks,
    size: 40,
    numOfHorizontalSqrs: 2,
    numOfVerticalSqrs: 3,
    square: (index) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.greenAccent, borderRadius: BorderRadius.circular(4)),
      );
    },
  ),
);

Widget hFigureBlocks = Positioned(
  width: 60,
  left: 0,
  top: 30,
  child: Board(
    coords: horizontalFigureBlocks,
    size: 60,
    numOfHorizontalSqrs: 3,
    numOfVerticalSqrs: 2,
    square: (index) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.redAccent, borderRadius: BorderRadius.circular(4)),
      );
    },
  ),
);

Widget verticalLineBlocks = Positioned(
  width: 20,
  right: 0,
  bottom: 0,
  child: Board(
    coords: lineBlocks,
    size: 20,
    numOfHorizontalSqrs: 1,
    numOfVerticalSqrs: 4,
    square: (index) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.purpleAccent, borderRadius: BorderRadius.circular(4)),
      );
    },
  ),
);
