import 'package:flutter/material.dart';
import 'package:recycling_app/recycling_camera.dart';
import 'mocks/mock_home.dart';
import 'home_list.dart';
import 'nearby_centre.dart';
import 'camera_test.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:recycling_app/page_three.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mockHome = MockHome.fetchAll();
    return Scaffold(
      appBar: AppBar(
        title: Text('Recycling App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the Recycling App!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeList(mockHome)),
                );
              },
              child: Text('Recyclable Materials'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NearByPlacesScreen()),
                );
              },
              child: Text('Nearby Recycling Centers'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecyclingCamera()),
                );
              },
              child: Text('Recycling Camera'),
            ),
          ],
        ),
      ),
    );
  }
}
