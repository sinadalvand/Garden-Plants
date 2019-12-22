import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Handler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _HandleBar(MediaQuery.of(context).size.width),
    );
  }
}

class _HandleBar extends CustomPainter {
  var width;

  _HandleBar(this.width);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.grey.withOpacity(0.4);
    paint.strokeWidth = 4;
    paint.strokeCap = StrokeCap.round;
    paint.style = PaintingStyle.stroke;

    var Vwidth = width / 8;

    canvas.drawLine(Offset(-Vwidth / 2, 0), Offset(Vwidth / 2, 0), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
