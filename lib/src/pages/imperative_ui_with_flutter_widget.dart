import 'package:flutter/material.dart';

class ImperativeUiWithFlutterWidget extends StatefulWidget {
  const ImperativeUiWithFlutterWidget({super.key});

  @override
  State<ImperativeUiWithFlutterWidget> createState() =>
      _ImperativeUiWithFlutterWidgetState();
}

class _ImperativeUiWithFlutterWidgetState
    extends State<ImperativeUiWithFlutterWidget> {
  double _leftPosition = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('선언형 UI with Flutter Widget'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedPositioned(
            left: _leftPosition,
            duration: const Duration(seconds: 1),
            child: Container(
              width: 100,
              height: 200,
              color: Colors.pink,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _leftPosition = MediaQuery.of(context).size.width - 100;
          });
        },
      ),
    );
  }
}
