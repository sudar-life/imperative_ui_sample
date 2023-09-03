import 'package:flutter/material.dart';

class DeclarativeUi extends StatelessWidget {
  const DeclarativeUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('명령형 UI'),
      ),
      body: const _MovingWidget(),
    );
  }
}

class _MovingWidget extends StatefulWidget {
  const _MovingWidget({super.key});

  @override
  State<_MovingWidget> createState() => __MovingWidgetState();
}

class __MovingWidgetState extends State<_MovingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  double _leftPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween(begin: 0.0, end: 300.0).animate(_controller)
      ..addListener(() {
        setState(() {
          _leftPosition = _animation.value;
        });
      });
    _startAnimation();
  }

  void _startAnimation() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          left: _leftPosition,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}
