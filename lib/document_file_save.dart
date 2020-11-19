
import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/services.dart';

class DocumentFileSave {
  static const MethodChannel _channel =
      const MethodChannel('document_file_save');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> get batteryPercentage async {
    final int battery = await _channel.invokeMethod('getBatteryPercentage');
    return battery;
  }

  static Future<void> saveMultipleFiles(List<Uint8List> dataList, List<String> fileNameList, List<String> mimeTypeList) async {
    try {
      await _channel.invokeMethod('saveMultipleFiles', {
        "dataList": dataList,
        "fileNameList": fileNameList,
        "mimeTypeList": mimeTypeList
      });
    } on PlatformException {
      rethrow;
    }
  }

  static Future<void> saveFile(Uint8List data, String fileName, String mimeType) async {
    await saveMultipleFiles([data], [fileName], [mimeType]);
  }
}
