import 'package:flutter/material.dart';
// import 'package:amap_map_fluttify/amap_map_fluttify.dart';
// import 'map/map.screen.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

void main() async {
  // await AmapService.init(iosKey: '7a***********************f4', androidKey: '');

  runApp(MyApp());

  // await enableFluttifyLog(true);
  // await AmapService.init(
  //   iosKey: '7a04506d15fdb7585707f7091d715ef4',
  //   androidKey: '9cbe58696054e13af8b1af03b3b83116',
  //   webApiKey: 'e69c6fddf6ccf8de917f5990deaa9aa2',
  // );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '高德地图测试'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // AMapController _controller;
  // AmapController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new FlutterMap(
          options: new MapOptions(
            center: new LatLng(32.04, 118.78),
            zoom: 13.0,
          ),
          layers: [
            new TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            new MarkerLayerOptions(
              markers: [
                new Marker(
                  width: 80.0,
                  height: 80.0,
                  point: new LatLng(32.04, 118.78),
                  builder: (ctx) => new Container(
                    child: null,
                  ),
                ),
              ],
            ),
          ],
        ));
    // AmapView(
    //   onMapCreated: (controller) async {
    //     _controller = controller;
    //   },
    // ))
  }
}
