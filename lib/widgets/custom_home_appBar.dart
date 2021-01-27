import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pets_adoption_app/screens/home.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () => MasterScreen.of(context).open(),
                icon: FaIcon(
                  FontAwesomeIcons.bars,
                  color: Colors.black54,
                ),
                alignment: Alignment.centerLeft,
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Location",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: <Widget>[
                  FaIcon(
                    FontAwesomeIcons.mapMarkerAlt,
                    color: Color(0xff416C6E),
                    size: 18,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Kyiv, ",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Ukraine",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                    ),
                  ),
                ],
              )
            ],
          ),
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar2.jpg'),
          ),
        ],
      ),
    );
  }
}
