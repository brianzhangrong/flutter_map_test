import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bmfbase/BaiduMap/bmfmap_base.dart';
// import 'package:flutter_bmfmap/BaiduMap/map/bmf_map_view.dart';
// import 'package:flutter_bmfmap/BaiduMap/models/bmf_map_options.dart';
import 'package:flutter_bmfmap/BaiduMap/bmfmap_map.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // 百度地图sdk初始化鉴权
  if (Platform.isIOS) {
    BMFMapSDK.setApiKeyAndCoordType(
        'nNwiLTEsaSOkieCNdOle8sAIj7gA2y1H', BMF_COORD_TYPE.BD09LL);
  } else if (Platform.isAndroid) {
    // Android 目前不支持接口设置Apikey,
    // 请在主工程的Manifest文件里设置，详细配置方法请参考官网(https://lbsyun.baidu.com/)demo
    BMFMapSDK.setCoordType(BMF_COORD_TYPE.BD09LL);
  }
  // SDKInitializer.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '百度地图测试'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BMFMapWidget(
          onBMFMapCreated: (controller) {
            // onBMFMapCreated(controller);
            print('-----' + controller.getMapType().toString());
          },
          mapOptions: BMFMapOptions(
              center: BMFCoordinate(32.04, 118.78),
              zoomLevel: 14,
              mapPadding:
                  BMFEdgeInsets(left: 30, top: 30, right: 30, bottom: 30)),
        ));
  }
}
