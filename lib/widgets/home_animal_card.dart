import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pets_adoption_app/screens/home.dart';

enum AnimalGender { male, female }

class AnimalInfoCard extends StatelessWidget {
  AnimalInfoCard({
    Key key,
    this.animalName = 'No Name',
    this.animalKind = "Abyssinian cat",
    this.distance = 0.0,
    this.age = 1,
    this.gender = AnimalGender.male,
    this.animalPicPath,
    this.colorGradient,
  }) : super(key: key);

  final String animalName;
  final String animalKind;
  final double distance;
  final int age;
  final AnimalGender gender;
  final String animalPicPath;
  final List<Color> colorGradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: double.infinity,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: 45,
            left: 23,
            child: Container(
              height: 150,
              width: response.screenWidth - 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    offset: Offset(0, 15),
                    spreadRadius: -6,
                    blurRadius: 15,
                  )
                ],
              ),
              padding: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 135,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            animalName,
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Transform.rotate(
                            angle: gender == AnimalGender.female
                                ? degToRad(130)
                                : 0,
                            child: FaIcon(
                              gender == AnimalGender.female
                                  ? FontAwesomeIcons.venus
                                  : FontAwesomeIcons.mars,
                              color: Colors.black26,
                              size: 28,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      animalKind,
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "$age years old",
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 135,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FaIcon(
                            FontAwesomeIcons.mapMarkerAlt,
                            color: Color(0xff416C6E),
                            size: 17,
                          ),
                          Text(
                            "Distance: ${distance.toStringAsFixed(1)} km",
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
            ),
          ),
          Positioned(
            left: 23,
            top: 24,
            child: Hero(
              tag: '$animalPicPath-path',
              child: Container(
                height: 200,
                width: 170,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:
                        colorGradient ?? [Color(0xffCCD5D9), Color(0xffB9C6CB)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      offset: Offset(-10, 15),
                      spreadRadius: -6,
                      blurRadius: 15,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -10,
            left: -5,
            child: Hero(
              tag: '$animalPicPath-name',
              child: Image.asset(
                'assets/images/$animalPicPath',
                height: 220,
              ),
            ),
          )
        ],
      ),
    );
  }
}
