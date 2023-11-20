import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class NearbyCentre extends StatefulWidget {
  @override
  _NearbyCentreState createState() => _NearbyCentreState();
}

class _NearbyCentreState extends State<NearbyCentre> {
  late GoogleMapController mapController;
  late LocationData currentLocation;
  Location location = Location();

  @override
  void initState() {
    super.initState();
    location.onLocationChanged.listen((LocationData cLoc) {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Recycling Centers'),
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
}

// nearby cere list test
// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Nearby Recycling Centers'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             ElevatedButton(
//                 onPressed: () {
//                   sendRequest();
//                 },
//                 child: const Text("Get Nearby Places")),
//             if (nearbyPlacesResponse.places != null)
//               for (int i = 0; i < nearbyPlacesResponse.places!.length; i++)
//                 nearbyPlacesWidget(nearbyPlacesResponse.places![i])
//           ],
//         ),
//       ),
//     );
//   }