import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pets_adoption_app/screens/home.dart';
import 'dart:math' as math;

double degToRad(double angle) {
  return -angle * (math.pi / 180);
}

class CenterDetailsCard extends StatelessWidget {
  const CenterDetailsCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, 0.12),
      child: Container(
        height: 130,
        width: response.screenWidth - 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: Offset(0, 15),
              spreadRadius: -8,
              blurRadius: 10,
            )
          ],
        ),
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Sola",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Transform.rotate(
                  angle: degToRad(130),
                  child: FaIcon(
                    FontAwesomeIcons.venus,
                    color: Colors.black26,
                    size: 28,
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Abyssinian cat",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "2 years old",
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              width: response.screenWidth - 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FaIcon(
                    FontAwesomeIcons.mapMarkerAlt,
                    color: Color(0xff416C6E),
                    size: 17,
                  ),
                  Text(
                    "5 Bulvarono-Kudriavska-Street, Kyiv",
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
