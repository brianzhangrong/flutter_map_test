import 'package:flutter/material.dart';
import 'package:t/pages/CustomWidgets/function_item.widget.dart';
import 'package:t/pages/CustomWidgets/map_appbar.dart';
import 'package:t/pages/Utils/open_baidumap_navipage.dart';

class FlutterBMFUtilsDemo extends StatelessWidget {
  const FlutterBMFUtilsDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BMFAppBar(
        title: '实用工具',
        isBack: false,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            FunctionItem(
                label: '调起百度地图客户端',
                sublabel: 'OpenBaiduMapNaviPage',
                target: OpenBaiduMapNaviPage()),
          ],
        ),
      ),
    );
  }
}
