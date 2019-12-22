import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagePointer extends StatefulWidget {
  Size _size;
  String text;
  int delay;

  ImagePointer(this._size, {this.text, this.delay});

  @override
  State<StatefulWidget> createState() {
    return _ImagePosinterState();
  }
}

class _ImagePosinterState extends State<ImagePointer>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  Animation<double> _animation2;
  AnimationController controller;
  double percent= 0;
  double percent2 = 0;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: Duration(milliseconds: 3500), vsync: this);

    controller.forward();

//
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.stop();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          percent = _animation.value;
          print("Hello: " + percent.toString());
        });
      });
    _animation2 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)))
      ..addListener(() {
        setState(() {
          percent2 = _animation2.value;
          print("Hello: " + percent.toString());
        });
      });

    return Column(
      children: <Widget>[
        AnimatedOpacity(
          opacity: percent,
          duration: Duration(microseconds: 0),
          child: CustomPaint(
            size: widget._size,
            painter: Squre(percent),
          ),
        ),
        AnimatedOpacity(
          opacity: percent2,
          duration: Duration(microseconds: 0),
          child: widget.text == null
              ? Container()
              : Text(
                  widget.text,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Squre extends CustomPainter {
  final double percent;
  final Paint _paint = Paint()
    ..strokeWidth = 1.5
    ..color = Colors.white
    ..style = PaintingStyle.stroke;

  Squre(this.percent);

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path()
      ..addRRect(
          RRect.fromLTRBR(0, 0, size.width, size.height, Radius.circular(7)));

//    canvas.drawRRect(, _paint);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(Squre oldDelegate) {
    return oldDelegate.percent != percent;
  }
}
