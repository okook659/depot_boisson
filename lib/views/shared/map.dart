import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late MapController controller;
  GeoPoint? currentLocation;
  GeoPoint? selectedLocation;

  @override
  void initState() {
    super.initState();
    controller = MapController(
      initPosition: GeoPoint(latitude: 6.1725, longitude: 1.2314), // Lomé, Togo
    );
    _getCurrentLocation();
    _initTapListener(); // Ajout du listener dès le début
  }

  // Fonction pour obtenir la localisation actuelle
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Les services de localisation sont désactivés");
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("Permission refusée");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print("Permission refusée définitivement");
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      currentLocation = GeoPoint(
        latitude: position.latitude,
        longitude: position.longitude,
      );

      // Centrer la carte sur la position actuelle
      controller.changeLocation(currentLocation!);
    });
  }

  // Initialisation du listener pour récupérer le point sélectionné
  void _initTapListener() {
    controller.listenerMapSingleTapping.addListener(() async {
      GeoPoint? pickedLocation = controller.listenerMapSingleTapping.value;
      if (pickedLocation != null) {
        setState(() {
          selectedLocation = pickedLocation;
        });

        print("Point sélectionné: ${pickedLocation.latitude}, ${pickedLocation.longitude}");

        // Tracer l'itinéraire après avoir sélectionné un point
        _drawRoute();
      }
    });
  }

  // Fonction pour tracer l'itinéraire entre currentLocation et selectedLocation
  Future<void> _drawRoute() async {
    if (currentLocation != null && selectedLocation != null) {
      await controller.drawRoad(
        currentLocation!,
        selectedLocation!,
        roadOption: const RoadOption(
          roadColor: Colors.blue,
          roadWidth: 5,
        ),
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carte")),
      body: Stack(
        children: [
          OSMFlutter(
            controller: controller,
            osmOption: OSMOption(
              userTrackingOption: UserTrackingOption(
                enableTracking: true,
                unFollowUser: false,
              ),
              zoomOption: ZoomOption(
                initZoom: 12,
                minZoomLevel: 3,
                maxZoomLevel: 19,
                stepZoom: 1.0,
              ),
              userLocationMarker: UserLocationMaker(
                personMarker: MarkerIcon(
                  icon: Icon(
                    Icons.location_history_rounded,
                    color: Colors.red,
                    size: 48,
                  ),
                ),
                directionArrowMarker: MarkerIcon(
                  icon: Icon(
                    Icons.double_arrow,
                    size: 48,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: ElevatedButton(
              onPressed: () {
                if (selectedLocation == null) {
                  print("Aucun point sélectionné !");
                } else {
                  print("Itinéraire en cours...");
                  _drawRoute();
                }
              },
              child: Text("Tracer l'itinéraire"),
            ),
          ),
        ],
      ),
    );
  }
}
