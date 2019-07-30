import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class FlutterForbidshot {
  static const MethodChannel _methodChannel =
      const MethodChannel('flutter_forbidshot');
  static const EventChannel _eventChannel =
      const EventChannel('flutter_forbidshot_change');

  static Future<bool> get iosIsCaptured async {
    if (Platform.isIOS) {
      final bool isCaptured = await _methodChannel.invokeMethod('isCaptured') as bool;
      return isCaptured;
    }
  }

  static Stream<String> get iosShotChange {
    if (Platform.isIOS) {
      return _eventChannel.receiveBroadcastStream().map((dynamic event) {
          return event;
        },
      );
    }
  }

  static setAndroidForbidOn() {
    if (Platform.isAndroid) {
      _methodChannel.invokeMethod('setOn');
    }
  }

  static setAndroidForbidOff() {
    if (Platform.isAndroid) {
      _methodChannel.invokeMethod('setOff');
    }
  }
}
