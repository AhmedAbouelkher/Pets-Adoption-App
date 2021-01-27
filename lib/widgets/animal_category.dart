import 'package:flutter/material.dart';
import 'package:pets_adoption_app/models/animal_categorys.dart';
import 'package:provider/provider.dart';

class AnimalsCatogeriesTaps extends StatelessWidget {
  const AnimalsCatogeriesTaps({
    Key key,
    @required this.provider,
  }) : super(key: key);

  final AnimalsCatergory provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: provider.animals.length,
        itemBuilder: (BuildContext context, int index) {
          final animal = provider.animals[index];
          return GestureDetector(
            onTap: () {
              Provider.of<AnimalsCatergory>(context, listen: false)
                  .selectAnimal(index);
            },
            child: AnimalCategory(
              title: animal.title,
              animalOutlineName: animal.animalOutlineName,
              isSelected: animal.isSelected,
            ),
          );
        },
      ),
    );
  }
}

class AnimalCategory extends StatelessWidget {
  const AnimalCategory({
    Key key,
    this.title,
    this.animalOutlineName,
    this.isSelected = false,
  }) : super(key: key);
  final bool isSelected;
  final String title;
  final String animalOutlineName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 5,
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: isSelected ? Colors.teal : Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: isSelected
                      ? Colors.teal.withOpacity(0.5)
                      : Colors.black.withOpacity(0.08),
                  offset: Offset(0, 15),
                  spreadRadius: -6,
                  blurRadius: 15,
                )
              ],
            ),
            child: Image.asset(
              'assets/images/$animalOutlineName',
              color: isSelected ? Colors.white : Colors.black54,
              fit: BoxFit.none,
              scale: 7.5,
            ),
          ),
          SizedBox(height: 13),
          Text(
            title,
            style: TextStyle(
              color: Colors.black38,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
