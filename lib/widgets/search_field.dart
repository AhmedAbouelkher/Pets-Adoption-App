import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: TextField(
              autocorrect: false,
              onChanged: (newText) {},
              decoration: InputDecoration(
                hintText: 'Search pet to adopt',
                hintStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none,
                icon: FaIcon(
                  FontAwesomeIcons.search,
                  color: Colors.black12,
                  size: 21,
                ),
              ),
            ),
          ),
          FaIcon(
            FontAwesomeIcons.slidersH,
            color: Colors.black12,
            size: 21,
          ),
        ],
      ),
    );
  }
}
