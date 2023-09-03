import 'package:flutter/material.dart';

class ImperativeUi extends StatelessWidget {
  const ImperativeUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('선언형 UI'),
      ),
      body: _MovingWidget(
        duration: Duration(milliseconds: 500),
        initLeftPosition: 0,
        targetLeftPosition: 100,
        object: Container(
          width: 200,
          height: 100,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class _MovingWidget extends StatefulWidget {
  final double initLeftPosition;
  final double targetLeftPosition;
  final Duration duration;
  final Widget object;
  const _MovingWidget({
    super.key,
    required this.initLeftPosition,
    required this.targetLeftPosition,
    required this.duration,
    required this.object,
  });

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
    _leftPosition = widget.initLeftPosition;
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation =
        Tween(begin: 0.0, end: widget.targetLeftPosition).animate(_controller)
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
          child: widget.object,
        )
      ],
    );
  }
}
