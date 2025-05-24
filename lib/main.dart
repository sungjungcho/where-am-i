import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SubwayMapScreen(),
    );
  }
}

class SubwayMapScreen extends StatefulWidget {
  @override
  State<SubwayMapScreen> createState() => _SubwayMapScreenState();
}

class _SubwayMapScreenState extends State<SubwayMapScreen> {
  int selectedTab = 1; // 0: Bus, 1: Subway

  final List<String> stations = ['Pioneer Square', 'University St', 'Pioneer Square'];
  final LatLng center = const LatLng(47.6062, -122.3321);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 상단 탭
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 8),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedTab = 0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: selectedTab == 0 ? Colors.white : Colors.white70,
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(16)),
                        border: Border.all(color: Colors.blue),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Bus',
                        style: TextStyle(
                          color: selectedTab == 0 ? Colors.black : Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedTab = 1),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: selectedTab == 1 ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(16)),
                        border: Border.all(color: Colors.blue),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Subway',
                        style: TextStyle(
                          color: selectedTab == 1 ? Colors.white : Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 지도
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(target: center, zoom: 13),
                  polylines: {
                    Polyline(
                      polylineId: PolylineId('subway'),
                      color: Colors.blue,
                      width: 6,
                      points: [
                        LatLng(47.6097, -122.3331), // University St
                        LatLng(47.6017, -122.3316), // Pioneer Square
                      ],
                    ),
                  },
                  markers: {
                    Marker(
                      markerId: MarkerId('University St'),
                      position: LatLng(47.6097, -122.3331),
                      infoWindow: InfoWindow(title: 'University St'),
                    ),
                    Marker(
                      markerId: MarkerId('Pioneer Square'),
                      position: LatLng(47.6017, -122.3316),
                      infoWindow: InfoWindow(title: 'Pioneer Square'),
                    ),
                  },
                  myLocationEnabled: false,
                  zoomControlsEnabled: false,
                ),
                // 하단 역 리스트 카드
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Icon(Icons.circle, color: Colors.blue, size: 20),
                                Container(width: 2, height: 30, color: Colors.blue),
                                Icon(Icons.circle, color: Colors.blue, size: 20),
                              ],
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Pioneer Square', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                Text('University St', style: TextStyle(fontSize: 16)),
                                Text('Pioneer Square', style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}