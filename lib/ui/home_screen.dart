import 'package:flutter/material.dart';
import 'package:wheelscroll/data/states.dart';
import 'package:wheelscroll/ui/tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //* List of States
  List<States> states = [];

  String currentState = "Select a state";
  //late FixedExtentScrollController _controller;

  @override
  void initState() {
    super.initState();
    states = allStates();
    //_controller = FixedExtentScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      //   appBar: AppBar(
      //     backgroundColor: Colors.blueGrey.shade800,
      //     title: const Text(
      //       'States & Union Territories',
      //       style: TextStyle(
      //         fontSize: 22,
      //         color: Colors.white,
      //       ),
      //     ),
      //   ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              height: 60,
              width: 200,
              child: Center(
                child: Container(
                  height: 65,
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade700,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListWheelScrollView.useDelegate(
                  //controller: _controller,
                  itemExtent: 50,
                  perspective: 0.001,
                  diameterRatio: 1.6,
                  physics: FixedExtentScrollPhysics(),
                  squeeze: 1.0,
                  useMagnifier: true,
                  magnification: 1.3,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      currentState = states[index].names!;
                    });
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: states.length,
                    builder: (context, index) {
                      return MyTile(
                        states: states[index].names!,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
