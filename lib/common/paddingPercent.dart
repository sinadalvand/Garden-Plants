import 'package:flutter/cupertino.dart';

class PaddingPercent extends StatelessWidget {
  double percent = 0;

  PaddingPercent(this.percent);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    print(size);
    return Padding(
      padding: EdgeInsets.only(top: size * percent),
    );
  }
}
