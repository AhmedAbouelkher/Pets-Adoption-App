import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pets_adoption_app/screens/home.dart';

class Settings extends StatelessWidget {
  const Settings({
    Key key,
    @required this.initialLeftPosition,
    @required this.animationValue,
  }) : super(key: key);

  final double initialLeftPosition;
  final double animationValue;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: initialLeftPosition,
      bottom: 30,
      child: Transform(
        transform: Matrix4.identity()
          ..translate(0.0, 100.0 * (1 - animationValue)),
        child: Container(
          width: 180,
          height: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FaIcon(
                Icons.settings,
                color: Color(0xff88B3B5),
              ),
              Text(
                "Settings",
                style: TextStyle(
                  color: Color(0xff88B3B5),
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                color: Color(0xff88B3B5),
                height: 20,
                width: 1,
              ),
              Text(
                "Log out",
                style: TextStyle(
                  color: Color(0xff88B3B5),
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserQuickInfo extends StatelessWidget {
  const UserQuickInfo({
    Key key,
    @required this.initialLeftPosition,
    @required this.userAvatarTranslation,
  }) : super(key: key);

  final double initialLeftPosition;
  final double userAvatarTranslation;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: initialLeftPosition,
      child: Transform(
        transform: Matrix4.identity()..translate(userAvatarTranslation),
        child: Container(
          width: 210,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar2.jpg'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Nadia Elshazlykaya",
                    style: TextStyle(
                      color: Color(0xffEAF5F6),
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Active Status",
                    style: TextStyle(
                      color: Color(0xff88B3B5),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Navigation extends StatelessWidget {
  const Navigation({
    Key key,
    @required this.initialLeftPosition,
    @required this.navigationTranslation,
  }) : super(key: key);

  final double initialLeftPosition;
  final double navigationTranslation;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: response.screenHeight * 0.25,
      left: initialLeftPosition,
      child: Transform(
        transform: Matrix4.identity()..translate(navigationTranslation),
        child: Container(
          height: 400,
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              NavigationMenuItem(
                icon: FontAwesomeIcons.paw,
                isSelected: true,
                title: "Adoption",
              ),
              NavigationMenuItem(
                icon: FontAwesomeIcons.home,
                title: "Donation",
              ),
              NavigationMenuItem(
                icon: FontAwesomeIcons.plus,
                title: "Add pet",
              ),
              NavigationMenuItem(
                icon: FontAwesomeIcons.heart,
                title: "Favorites",
              ),
              NavigationMenuItem(
                icon: FontAwesomeIcons.envelope,
                title: "Messages",
              ),
              NavigationMenuItem(
                icon: FontAwesomeIcons.userAlt,
                title: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationMenuItem extends StatelessWidget {
  const NavigationMenuItem({
    Key key,
    this.title = "No Title",
    this.icon = Icons.ac_unit,
    this.isSelected = false,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 40),
      child: Row(
        children: <Widget>[
          FaIcon(
            icon,
            color: isSelected ? Color(0xffEAF5F6) : Color(0xff88B3B5),
            size: 20,
          ),
          SizedBox(width: 20),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Color(0xffEAF5F6) : Color(0xff88B3B5),
              fontWeight: FontWeight.w700,
              fontSize: 17,
            ),
          )
        ],
      ),
    );
  }
}
