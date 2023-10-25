import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  static const String routeName = '/map';
  @override
  _MapPageState createState() => _MapPageState();
}
class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services near you'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(13.326025, 77.126434),
          zoom: 14,
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=Jc6tYsL9LMySbIqzCE6I',
            maxZoom: 19,
            // attribution: 'Map data © OpenStreetMap contributors',
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 45.0,
                height: 45.0,
                point: LatLng(13.326025,
                    77.126434), // Set the marker at the user's location
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.my_location,
                    color: Colors.blue,
                    size: 45.0,
                  ),
                ),
              ),
              Marker(
                width: 45.0,
                height: 45.0,
                point: LatLng(13.341554 + .0080,
                    77.105367 + .0400), // Set the marker at the user's location
                builder: (ctx) => Container(
                  child: GestureDetector(
                    onTap: () {
                      // Show text when marker is tapped
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Green Earth Foundation'),
                            content: Text(
                                'One place for all your E-waste\n\nContact:+91-5654-848484'),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 45.0,
                    ),
                  ),
                ),
              ),
              Marker(
                width: 45.0,
                height: 45.0,
                point: LatLng(13.334426,
                    77.123780), // Set the marker at the user's location
                builder: (ctx) => Container(
                  child: GestureDetector(
                    onTap: () {
                      // Show text when marker is tapped
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('E-waste waale'),
                            content: Text(
                                'One place for all your E-waste\n\nContact:+91-5654-848484'),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 45.0,
                    ),
                  ),
                ),
              ),
              Marker(
                width: 45.0,
                height: 45.0,
                point: LatLng(13.320883,
                    77.139962), // Set the marker at the user's location
                builder: (ctx) => Container(
                  child: GestureDetector(
                    onTap: () {
                      // Show text when marker is tapped
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Green Earth Recycling Service'),
                            content: Text(
                                'One place for all your E-waste\n\nContact:+91-5654-848484'),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 45.0,
                    ),
                  ),
                ),
              ),
              Marker(
                width: 45.0,
                height: 45.0,
                point: LatLng(13.308095,
                    77.106094), // Set the marker at the user's location
                builder: (ctx) => Container(
                  child: GestureDetector(
                    onTap: () {
                      // Show text when marker is tapped
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Ramesh E-waste Recycler'),
                            content: Text(
                                'One place for all your E-waste\n\nContact:+91-5654-848484'),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors
                                      .lightBlueAccent, // Change the button color here
                                ),
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 45.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
