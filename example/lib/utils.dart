import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;

class Utils {
  ///相机搜索 进入结果页 无数据 标记
  bool isRepeatCameraSearch = false;


  Utils._();

  ///日志打印
  void printDebugLog(Object object) {
    print("example : " + object);
  }
}

var utils = new Utils._();
