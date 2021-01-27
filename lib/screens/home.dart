import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pets_adoption_app/models/animal_categorys.dart';
import 'package:pets_adoption_app/screens/adoption.dart';
import 'package:pets_adoption_app/widgets/navigation.dart';
import 'package:provider/provider.dart';
import 'package:response/response.dart';
import 'dart:math' as math;

double degToRad(double angle) {
  return -angle * (math.pi / 180);
}

var response = ResponseUI();

class MasterScreen extends StatefulWidget {
  static _MasterScreenState of(BuildContext context) => context.findAncestorStateOfType<_MasterScreenState>();
  @override
  _MasterScreenState createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  Animation<Color> _appBarColorTransAnimation;
  static double maxSlide = response.screenWidth * 0.60;
  double minDragStartEdge = 60;
  double maxDragStartEdge = maxSlide - 30;
  bool _canBeDragged = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
    _appBarColorTransAnimation = ColorTween(begin: Colors.grey[50], end: Color(0xff416C6E)).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  void close() => _animationController.reverse();
  void open() => _animationController.forward();
  void toggleDrawer() => _animationController.isCompleted ? close() : open();

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft = _animationController.isDismissed && details.globalPosition.dx < minDragStartEdge;
    bool isDragCloseFromRight = _animationController.isCompleted && details.globalPosition.dx > maxDragStartEdge;

    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta / maxSlide;
      _animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    //I have no idea what it means, copied from Drawer
    double _kMinFlingVelocity = 365.0;

    if (_animationController.isDismissed || _animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= _kMinFlingVelocity) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx / MediaQuery.of(context).size.width;

      _animationController.fling(velocity: visualVelocity);
    } else if (_animationController.value < 0.5) {
      close();
    } else {
      open();
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AnimalsCatergory>(context);
    return WillPopScope(
      onWillPop: () async {
        if (_animationController.isCompleted) {
          close();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: PreferredSize(
          child: AnimatedBuilder(
            animation: _appBarColorTransAnimation,
            // child: child,
            builder: (BuildContext context, Widget child) {
              return AppBar(
                backgroundColor: _appBarColorTransAnimation.value,
                brightness: _appBarColorTransAnimation.isCompleted ? Brightness.dark : Brightness.light,
                elevation: 0,
              );
            },
          ),
          preferredSize: Size.fromHeight(0),
        ),
        body: SafeArea(
          bottom: false,
          child: AnimatedBuilder(
            animation: _animation,
            builder: (BuildContext context, Widget child) {
              final double animationValue = _animation.value;
              final double initialLeftPosition = 25;
              final double contentScale = 1.0 - (0.3 * animationValue);
              final double navigationTranslation = (1 - animationValue) * -200;
              final double userAvatarTranslation = (1 - animationValue) * -350;
              return Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  //background
                  Container(
                    height: response.screenHeight,
                    width: response.screenWidth,
                    color: Color(0xff416C6E),
                  ),
                  //Adoption Screen
                  AdoptionScreen(
                    animationValue: animationValue,
                    contentScale: contentScale,
                    animationController: _animationController,
                    provider: provider,
                    onHorizontalDragStart: _onDragStart,
                    onHorizontalDragUpdate: _onDragUpdate,
                    onHorizontalDragEnd: _onDragEnd,
                  ),
                  Navigation(
                    initialLeftPosition: initialLeftPosition,
                    navigationTranslation: navigationTranslation,
                  ),
                  UserQuickInfo(
                    initialLeftPosition: initialLeftPosition,
                    userAvatarTranslation: userAvatarTranslation,
                  ),
                  Settings(
                    initialLeftPosition: initialLeftPosition,
                    animationValue: animationValue,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
