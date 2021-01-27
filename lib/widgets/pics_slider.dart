import 'package:flutter/material.dart';
import 'package:pets_adoption_app/screens/home.dart';
import 'package:provider/provider.dart';

class AnimalPhotoesSlideshow extends StatelessWidget {
  AnimalPhotoesSlideshow({@required this.animation});
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    List<Widget> _images = [
      Hero(
        tag: 'cat1.png-name',
        child: Image.asset(
          'assets/images/cat1.png',
          scale: 2,
        ),
      ),
      Image.asset(
        'assets/images/cat2.png',
        scale: 2.5,
      ),
      Image.asset(
        'assets/images/cat1.png',
        scale: 2,
      ),
    ];
    var currentIndex = Provider.of<AnimalSliderNotifier>(context).index;
    List<PageViewIndictaor> _indicators = [];
    List<PageViewIndictaor> _generateIndictors() {
      for (var i = 0; i < _images.length; i++) {
        _indicators.add((i == currentIndex)
            ? PageViewIndictaor(isSelected: true)
            : PageViewIndictaor());
      }
      return _indicators;
    }

    return Align(
      alignment: Alignment(0, -0.93),
      child: SizedBox(
        width: response.screenWidth,
        height: response.screenHeight * 0.45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: response.screenWidth,
              height: response.screenHeight * 0.38,
              child: PageView(
                onPageChanged: (index) {
                  Provider.of<AnimalSliderNotifier>(context, listen: false)
                      .getIndex(index);
                },
                children: _images,
              ),
            ),
            SizedBox(height: 5),
            AnimatedBuilder(
              animation: animation,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _generateIndictors(),
              ),
              builder: (context, child) {
                return Opacity(
                  opacity: animation.value,
                  child: child,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class PageViewIndictaor extends StatelessWidget {
  const PageViewIndictaor({
    Key key,
    this.width,
    this.height,
    this.isSelected = false,
  }) : super(key: key);
  final bool isSelected;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
      margin: EdgeInsets.only(right: 7),
      height: height ?? 6,
      width: isSelected ? 18 : (height ?? 6),
      decoration: BoxDecoration(
        color: isSelected ? Colors.teal : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class AnimalSliderNotifier extends ChangeNotifier {
  int _index = 0;
  int get index => _index;
  void getIndex(int index) {
    _index = index;
    notifyListeners();
  }
}
