import 'dart:io';

import 'package:flutter/material.dart';
import 'package:t/pages/CustomWidgets/function_item.widget.dart';
import 'package:t/pages/CustomWidgets/map_appbar.dart';
import 'package:t/pages/Map/show_custommap_page.dart';
import 'package:t/pages/Map/show_indoormap_page.dart';
import 'package:t/pages/Map/show_map_type_page.dart';
import 'package:t/pages/Map/show_multi_map_page.dart';
import 'package:t/pages/Map/show_textureviewmap_page.dart';
import 'package:t/pages/utils.dart';

/// 地图入创建入口
class ShowCreateMapPage extends StatelessWidget {
  const ShowCreateMapPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BMFAppBar(
          title: '创建地图',
          isBack: false,
        ),
        body: Container(
            child: ListView(children: <Widget>[
          FunctionItem(
            label: '地图类型示例',
            sublabel: '普通地图、卫星地图展示',
            target: ShowMapTypePage(),
          ),
          generatePlatformizationItem(Platform.isAndroid, 'TextureView地图示例',
              '地图由TextureView渲染', ShowTextureViewMapPage()),
          FunctionItem(
            label: '多地图示例',
            sublabel: '在同一个页面中创建多个地图展示',
            target: ShowMultiMapPage(),
          ),
          FunctionItem(
            label: '室内图示例',
            sublabel: '介绍室内图功能，显示室内图',
            target: ShowIndoorMapPage(),
          ),
          FunctionItem(
            label: '个性化地图示例',
            sublabel: '介绍个性化地图的创建和使用',
            target: ShowCustomMapPage(),
          ),
        ])));
  }
}
