import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:recycling_app/models/nearby_response.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:location/location.dart' as loc;
import 'package:http/http.dart' as http;

class NearByPlacesScreen extends StatefulWidget {
  const NearByPlacesScreen({Key? key}) : super(key: key);

  @override
  State<NearByPlacesScreen> createState() => _NearByPlacesScreenState();
}

class _NearByPlacesScreenState extends State<NearByPlacesScreen> {
  late GoogleMapController mapController;
  late loc.LocationData currentLocation;
  loc.Location location = loc.Location();
  final String apiKey = "";
  final String url = 'https://places.googleapis.com/v1/places:searchText';

  NearbyPlacesResponse nearbyPlacesResponse = NearbyPlacesResponse();

  @override
  void initState() {
    super.initState();
    location.onLocationChanged.listen((loc.LocationData cLoc) {
      currentLocation = cLoc;
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target:
                LatLng(currentLocation.latitude!, currentLocation.longitude!),
            zoom: 14.0,
          ),
        ),
      );
    });
    sendRequest(currentLocation.latitude, currentLocation.longitude);
    //             if (nearbyPlacesResponse.places != null)
    // for (int i = 0; i < nearbyPlacesResponse.places!.length; i++)
    //   nearbyPlacesWidget(nearbyPlacesResponse.places![i]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Recycling Centers'),
        centerTitle: true,
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(0.0, 0.0),
          zoom: 14.0,
        ),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        mapType: MapType.normal,
      ),
    );
  }

  Future<void> sendRequest(double? lat, double? long) async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'X-Goog-Api-Key': apiKey,
      'X-Goog-FieldMask':
          'places.displayName,places.location,places.googleMapsUri',
    };

    final Map<String, dynamic> body = {
      'textQuery': 'Recycling Centre',
      "locationBias": {
        "circle": {
          "center": {"latitude": lat, "longitude": long},
          "radius": 500.0
        }
      }
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        print('Response: ${response.body}');
        nearbyPlacesResponse =
            NearbyPlacesResponse.fromJson(jsonDecode(response.body));
        setState(() {});
        // Handle the response data as needed
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response: ${response.body}');
        // Handle the error
      }
    } catch (error) {
      print('Error: $error');
      // Handle the error
    }
  }

  // void getNearbyPlaces() async {

  //   var url = Uri.parse('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=' + latitude.toString() + ','
  //   + longitude.toString() + '&radius=' + radius + '&key=' + apiKey
  //   );

  //   var response = await http.post(url);

  //   nearbyPlacesResponse = NearbyPlacesResponse.fromJson(jsonDecode(response.body));

  //   setState(() {});

  // }

  Widget nearbyPlacesWidget(Places places) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Text("Name: " + places.displayName!.text!),
          Text("Location: " +
              places.location!.latitude.toString() +
              " , " +
              places.location!.longitude.toString()),
          // Text(results.openingHours != null ? "Open" : "Closed"),
        ],
      ),
    );
  }
}
