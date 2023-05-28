import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Geocoding",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Geocoding")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                List<Location> locations = await locationFromAddress("Gronausestraat 710, Enschede");
                print(locations.first.latitude);
                print(locations.first.longitude);
              },
              child: const Text("Get Location from Address"),
            ),
            ElevatedButton(
              onPressed: () async {
                List<Placemark> placemarks = await placemarkFromCoordinates(52.2165157, 6.9437819);
                print(placemarks.first.street);
                print(placemarks.first.country);
              },
              child: const Text("Get Placemarks from Address"),
            ),
          ],
        ),
      ),
    );
  }
}
