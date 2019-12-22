import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:garden_plants/common/imagePointer.dart';
import 'package:garden_plants/common/paddingPercent.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'common/panelHandler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Plants Garden',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: SlidingUpPanel(
            body: Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  PaddingPercent(0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: 24.0,
                          )),
                      Expanded(
                        flex: 7,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "Designed by Sina Dalvand",
                              style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  color: Colors.white70,
                                  fontStyle: FontStyle.normal),
                            ),
                            Text(
                              "Garden Plants",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                          size: 24.0,
                        ),
                      ),
                    ],
                  ),
                  PaddingPercent(0.06),
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Center(
                        child: new ClipRect(
                          child: new BackdropFilter(
                            filter:
                                new ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                            child: new Container(
                                decoration: new BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    color:
                                        Colors.grey.shade100.withOpacity(0.1)),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 8.0,
                                      bottom: 8.0,
                                      left: 17.0,
                                      right: 17.0),
                                  child: Text(
                                    "12 Picture",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          child: ImagePointer(Size(100, 100),text: "Focuse on detail"),
                          left: 75,
                          top: 75,
                        ),
                        Positioned(
                          child: ImagePointer(Size(100, 150),text: "Green",),
                          right: 50,
                          top: 180,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/back1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            panel: Container(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                PaddingPercent(0.03),
                Center(
                  child: Handler(),
                ),
                PaddingPercent(0.03),
                Expanded(
                  child: PlantList(),
                )
              ],
            )),
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(15.0),
                topRight: const Radius.circular(15.0)),
            defaultPanelState: PanelState.CLOSED,
          )),
    );
  }
}

class PlantList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PlantListState();
  }
}

class PlantListState extends State<PlantList> {


  final _images = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
    'assets/6.jpeg',
    'assets/7.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
    'assets/6.jpeg',
    'assets/7.jpg'
  ];
  final _names = [
    'Variegated',
    'Watermelon',
    'Metallic',
    'Pink Lady',
    'Silverleaf ',
    'Jayde',
    'Pixie',
    'Pink Lady',
    'Silverleaf ',
    'Jayde',
    'Pixie',
    'Metallic'
  ];

  @override
  Widget build(BuildContext context) {

    return _buildSuggestions();
  }

  Widget _buildSuggestions() {
    return GridView.builder(
      primary: false,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 1 / 1.5),
      itemCount: _images.length,
      itemBuilder: (context, index) {
        return GridTile(
            child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: new BorderRadius.circular(8.0),
                child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      _images[index],
                      width: 240.0,
                      height: 240.0,
                      fit: BoxFit.cover,
                    )),
              ),
              PaddingPercent(0.01),
              Container(
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Colors.grey.shade100.withOpacity(0.9)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 3.0, bottom: 3.0, left: 7.0, right: 7.0),
                    child: Text(
                      _names[index],
                      maxLines: 1,
                      style: TextStyle(color: Colors.black.withAlpha(200),fontSize: 12),
                    ),
                  )),
            ],
          ),
        ));
      },
    );
  }
}
