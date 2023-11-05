import 'package:flutter/material.dart';
import 'province.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProvinceList(),
    );
  }
}

class ProvinceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Provinsi')),
      body: ListView.builder(
        itemCount: provinces.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: Image.asset(provinces[index].image),
              title: Text(provinces[index].name),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapView(
                      latitude: provinces[index].latitude,
                      longitude: provinces[index].longitude,
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}

class MapView extends StatelessWidget {
  final double latitude;
  final double longitude;

  MapView({required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 14.0,
    );

    return Scaffold(
      appBar: AppBar(title: Text('Peta Kota')),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: {
          Marker(
            markerId: MarkerId('Kota'),
            position: LatLng(latitude, longitude),
            infoWindow: InfoWindow(title: 'Kota yang Diklik'),
          ),
        },
      ),
    );
  }
}
