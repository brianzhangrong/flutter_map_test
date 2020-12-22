import 'package:flutter/material.dart';
import 'package:t/pages/CustomWidgets/map_appbar.dart';
import 'package:flutter_bmfbase/BaiduMap/bmfmap_base.dart';
import 'package:flutter_bmfmap/BaiduMap/bmfmap_map.dart';
import 'package:t/pages/CustomWidgets/map_base_page_state.dart';
import 'package:t/pages/constants.dart';

/// 瓦片图示例
class ShowTileMapPage extends StatefulWidget {
  ShowTileMapPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new _ShowTileMapPageState();
  }
}

class _ShowTileMapPageState extends BMFBaseMapState<ShowTileMapPage> {
  // static const _tag = "_ShowTileMapPageState";

  // static const url =
  //     "http://online1.map.bdimg.com/tile/?qt=vtile&x={x}&y={y}&z={z}&styles=pl&scaler";

  BMFTile _tileOfflineMap;
  bool _offlineTileEnable = true;

  /// 创建完成回调
  @override
  void onBMFMapCreated(BMFMapController controller) {
    super.onBMFMapCreated(controller);

    /// 地图加载回调
    myMapController?.setMapDidLoadCallback(callback: () {
      if (_offlineTileEnable == true) {
        switchOfflineTile(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MaterialApp(
        home: Scaffold(
      appBar: BMFAppBar(
        title: '瓦片图示例',
        onBack: () {
          Navigator.pop(context);
        },
      ),
      body: Stack(children: <Widget>[
        generateMap(),
        generateControlBar(),
      ]),
    ));
  }

  /// 设置地图参数
  @override
  BMFMapOptions initMapOptions() {
    BMFMapOptions mapOptions = BMFMapOptions(
      center: BMFCoordinate(39.924257, 116.403263),
      zoomLevel: 16,
      maxZoomLevel: 18,
      minZoomLevel: 15,
      mapPadding: BMFEdgeInsets(top: 0, left: 50, right: 50, bottom: 0),
    );
    return mapOptions;
  }

  @override
  Widget generateControlBar() {
    return Container(
        width: screenSize.width,
        height: 60,
        color: Color(int.parse(Constants.controlBarColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Switch(
                value: _offlineTileEnable,
                activeColor: Colors.blue,
                onChanged: (bool value) {
                  setState(() {
                    _offlineTileEnable = value;
                  });
                  switchOfflineTile(value);
                }),
            Text(
              "开启离线瓦片图",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ));
  }

  // void switchOnlineTile(bool tileMapSwitch) {
  //   if (tileMapSwitch) {
  //     addOnlineTile();
  //   } else {
  //     removeOnlineTile();
  //   }
  // }

  // void addOnlineTile() {
  //   BMFCoordinateBounds visibleMapBounds = BMFCoordinateBounds(
  //       northeast: BMFCoordinate(80, 180), southwest: BMFCoordinate(-80, -180));
  //   BMFTile tile = BMFTile(
  //       tileLoadType: BMFTileLoadType.LoadUrlTile,
  //       url:
  //           'http://online1.map.bdimg.com/tile/?qt=vtile&x={x}&y={y}&z={z}&styles=pl&scaler=1&udt=20190528',
  //       visibleMapBounds: visibleMapBounds,
  //       maxZoom: 20,
  //       minZoom: 4);
  //   _tileOnlineMap = tile;
  //   myMapController?.addTile(tile);
  // }

  // void removeOnlineTile() {
  //   if (null == _tileOnlineMap) {
  //     return;
  //   }

  //   myMapController?.removeTile(_tileOnlineMap);
  //   _tileOnlineMap = null;
  // }

  void switchOfflineTile(bool tileMapSwitch) {
    if (tileMapSwitch) {
      addOfflineTile();
    } else {
      removeOfflineTile();
    }
  }

  void addOfflineTile() {
    BMFCoordinateBounds visibleMapBounds = BMFCoordinateBounds(
        northeast: BMFCoordinate(39.94001804746338, 116.41224644234747),
        southwest: BMFCoordinate(39.90299859954822, 116.38359947963427));

    BMFTile tile = BMFTile(
        tileLoadType: BMFTileLoadType.LoadLocalAsyncTile,
        visibleMapBounds: visibleMapBounds,
        maxZoom: 17,
        minZoom: 16);
    _tileOfflineMap = tile;
    myMapController?.addTile(tile);
  }

  void removeOfflineTile() {
    if (null == _tileOfflineMap) {
      return;
    }

    myMapController?.removeTile(_tileOfflineMap);
    _tileOfflineMap = null;
  }
}
