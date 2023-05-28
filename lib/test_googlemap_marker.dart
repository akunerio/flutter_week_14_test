import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Google Maps with Marker",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  late GoogleMapController mapController;
  List<Marker> _markers = <Marker>[];

  final LatLng _center = const LatLng(52.2165157, 6.9437819);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    setState(() {
      _markers.add(
        const Marker(
          markerId: MarkerId("1"),
          position: LatLng(52.2165157, 6.9437819),
          infoWindow: InfoWindow(
            title: "Marker 1",
            snippet: "This is Marker 1",
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Google Maps with Marker"),),
        body: GoogleMap(
          mapType: MapType.hybrid, //normal, satellite, hybrid
          onMapCreated: _onMapCreated,
          markers: Set<Marker>.of(_markers),
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        )
    );
  }
}