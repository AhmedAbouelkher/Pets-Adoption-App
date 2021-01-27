import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;

double degToRad(double angle) {
  return -angle * (math.pi / 180);
}

class UpperBar extends StatelessWidget {
  const UpperBar({
    Key key,
    this.animationController,
  }) : super(key: key);
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () => Navigator.pop(context),
            child: FaIcon(
              Icons.arrow_back,
              color: Colors.black38,
              size: 33,
            ),
          ),
          InkWell(
            child: Transform.rotate(
              angle: degToRad(90),
              child: FaIcon(
                FontAwesomeIcons.signOutAlt,
                color: Colors.black26,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
