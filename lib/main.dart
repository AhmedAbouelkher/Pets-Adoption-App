import 'package:flutter/material.dart';
import 'package:pets_adoption_app/models/animal_categorys.dart';
import 'package:pets_adoption_app/screens/home.dart';
import 'package:pets_adoption_app/widgets/pics_slider.dart';
import 'package:provider/provider.dart';
import 'package:response/response.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AnimalsCatergory()),
        ChangeNotifierProvider(create: (context) => AnimalSliderNotifier()),
      ],
      child: Response(
        child: MaterialApp(
          title: 'Pets Adoption',
          theme: ThemeData(fontFamily: 'Roboto'),
          home: MasterScreen(),
        ),
      ),
    );
  }
}
