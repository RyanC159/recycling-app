import 'package:flutter/material.dart';
// import 'models/home.dart';
// import 'home_detail.dart';
// import 'mocks/mock_home.dart';
// import 'home_list.dart';
import 'main_menu.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final mockHome = MockHome.fetchAll();
    return MaterialApp(home: MainMenu());
  }
}
