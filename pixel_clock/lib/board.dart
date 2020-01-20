import 'package:flutter/material.dart';

class Coord {
  final double top;
  final double left;
  final key;

  Coord({ this.top, this.left, this.key });
}

Widget defaultSquare = Container(
  decoration: BoxDecoration(
    color: Color(0xFFecf0f1),
    borderRadius: BorderRadius.circular(4)
  ),
);

class Board extends StatefulWidget {
  final double size;
  final double sqrSpace;
  final List<int> coords;
  final Widget Function(int index) square;
  final int numOfHorizontalSqrs;
  final int numOfVerticalSqrs;

  Board({
    Key key,
    this.coords,
    this.size = 80,
    this.square,
    this.sqrSpace = 4,
    this.numOfHorizontalSqrs = 3,
    this.numOfVerticalSqrs = 5
  }) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> with TickerProviderStateMixin {
  double initialTop;
  double initialLeft;
  double sqrSize;
  double height;
  List<Coord> baseCoords = [];

  @override
  void initState() {
    super.initState();
    sqrSize = (widget.size / widget.numOfHorizontalSqrs) - widget.sqrSpace;
    height = widget.numOfVerticalSqrs * sqrSize + ((widget.numOfVerticalSqrs - 1) * widget.sqrSpace);

    // generate 3x5 board
    for (var i = 0; i < widget.numOfVerticalSqrs; i++) {
      for (var j = 0; j < widget.numOfHorizontalSqrs; j++) {
        baseCoords.add(
            Coord(left: (sqrSize * j) + (widget.sqrSpace * j), top: (sqrSize * i) + (widget.sqrSpace * i)),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    final disabledCoord = widget.coords.lastIndexOf(1);

    List<Widget> items = baseCoords.map((item) {
      final index = baseCoords.indexOf(item);
      final isEnabled = widget.coords[index] == 1;

      return AnimatedPositioned(
        curve: Curves.easeInSine,
        duration: Duration(milliseconds: 400),
        height: sqrSize,
        width: sqrSize,
        top: isEnabled ? item.top : baseCoords[disabledCoord].top,
        left: isEnabled ? item.left : baseCoords[disabledCoord].left,
        child: widget.square != null ? widget.square(index) : defaultSquare
      );
    }).toList();

    return Container(
      height: height,
      width: widget.size,
      child: Stack(
        children: items,
      ),
    );
  }
}