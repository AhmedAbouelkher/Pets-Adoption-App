import 'package:flutter/material.dart';
import 'package:pets_adoption_app/models/animal_categorys.dart';
import 'package:pets_adoption_app/screens/animal_info.dart';
import 'package:pets_adoption_app/screens/home.dart';
import 'package:pets_adoption_app/widgets/animal_category.dart';
import 'package:pets_adoption_app/widgets/custom_home_appBar.dart';
import 'package:pets_adoption_app/widgets/home_animal_card.dart';
import 'package:pets_adoption_app/widgets/search_field.dart';

class AdoptionScreen extends StatelessWidget {
  const AdoptionScreen({
    Key key,
    @required this.animationValue,
    @required this.contentScale,
    @required AnimationController animationController,
    @required this.provider,
    this.onHorizontalDragStart,
    this.onHorizontalDragUpdate,
    this.onHorizontalDragEnd,
  })  : _animationController = animationController,
        super(key: key);

  final double animationValue;
  final double contentScale;
  final AnimationController _animationController;
  final AnimalsCatergory provider;
  final GestureDragStartCallback onHorizontalDragStart;
  final GestureDragUpdateCallback onHorizontalDragUpdate;
  final GestureDragEndCallback onHorizontalDragEnd;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.centerLeft,
      transform: Matrix4.identity()
        ..translate(response.screenWidth * 0.60 * animationValue)
        ..scale(contentScale, contentScale),
      child: GestureDetector(
        onHorizontalDragStart: onHorizontalDragStart,
        onHorizontalDragUpdate: onHorizontalDragUpdate,
        onHorizontalDragEnd: onHorizontalDragEnd,
        onTap: () {
          if (_animationController.isCompleted) {
            MasterScreen.of(context).close();
          }
        },
        child: Container(
          height: response.screenHeight,
          width: response.screenWidth,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30 * animationValue),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20,
                  spreadRadius: 10,
                )
              ]),
          child: IgnorePointer(
            ignoring: _animationController.isCompleted,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CustomAppBar(),
                  Container(
                    height: response.screenHeight,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(25),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 30),
                        SearchField(),
                        SizedBox(height: 30),
                        AnimalsCatogeriesTaps(provider: provider),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AnimalFullDetails(),
                              ),
                            );
                          },
                          child: AnimalInfoCard(
                            animalName: "Sola",
                            age: 2,
                            distance: 3.6,
                            // gender: ,
                            animalPicPath: 'cat1.png',
                          ),
                        ),
                        AnimalInfoCard(
                          animalName: "Orion",
                          age: 1,
                          distance: 7.8,
                          // gender: AnimalGender.male,
                          animalPicPath: 'cat2.png',
                          colorGradient: [Color(0xffE4C18D), Color(0xffECD4B1)],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
