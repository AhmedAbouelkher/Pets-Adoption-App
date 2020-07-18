import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:pets_adoption_app/screens/home.dart';
import 'package:pets_adoption_app/widgets/animal_bottomBar.dart';
import 'package:pets_adoption_app/widgets/animal_details_card.dart';
import 'package:pets_adoption_app/widgets/animal_upperBar.dart';
import 'package:pets_adoption_app/widgets/pics_slider.dart';

enum AnimalGender { male, female }

class AnimalFullDetails extends StatefulWidget {
  @override
  _AnimalFullDetailsState createState() => _AnimalFullDetailsState();
}

class _AnimalFullDetailsState extends State<AnimalFullDetails>
    with SingleTickerProviderStateMixin, AfterLayoutMixin<AnimalFullDetails> {
  AnimationController _controller;
  Animation<double> _animation;
  Animation<double> _delayedAnimation;
  CurvedAnimation _curvedAnimation;
  CurvedAnimation _delayedCurvedAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _delayedCurvedAnimation = CurvedAnimation(
        parent: _controller, curve: Interval(0.1, 1, curve: Curves.decelerate));
    _animation = Tween<double>(begin: 0, end: 1).animate(_curvedAnimation);
    _delayedAnimation =
        Tween<double>(begin: 0, end: 1).animate(_delayedCurvedAnimation);
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String details =
        '''My Job requiers moving to another country. I don't\nhave the oppotunity to take the cat with me. I am\nlooking for good people who will shelter my Sola.''';
    return Scaffold(
      body: SizedBox(
        width: response.screenWidth,
        height: response.screenHeight,
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Hero(
              tag: 'cat1.png-path',
              child: Container(
                height: response.screenHeight * 0.55,
                width: response.screenWidth,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xffCCD5D9), Color(0xffB9C6CB)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: AnimatedBuilder(
                child: BottomBar(details: details),
                animation: _animation,
                builder: (BuildContext context, Widget child) {
                  final animationValue = _animation.value;
                  final transformY = (1 - animationValue) * 30;
                  final opacity = animationValue;
                  return Transform(
                    transform: Matrix4.translationValues(0, transformY, 0),
                    child: Opacity(
                      opacity: opacity,
                      child: child,
                    ),
                  );
                },
              ),
            ),
            AnimatedBuilder(
              animation: _delayedAnimation,
              child: CenterDetailsCard(),
              builder: (context, child) {
                final animationValue = _delayedAnimation.value;
                final transformX = (1 - animationValue) * response.screenWidth;
                return Transform(
                  transform: Matrix4.translationValues(transformX, 0, 0),
                  child: child,
                );
              },
            ),
            AnimalPhotoesSlideshow(
              animation: _delayedAnimation,
            ),
            AnimatedBuilder(
              child: UpperBar(
                animationController: _controller,
              ),
              animation: _animation,
              builder: (BuildContext context, Widget child) {
                return Opacity(
                  opacity: _animation.value,
                  child: child,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(Duration(milliseconds: 200), () {
      _controller.forward();
    });
  }
}
