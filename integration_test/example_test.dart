import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol_sample/main.dart' as app;

void main() {
  patrolTest(
    'counter state is the same after going to home and switching apps',
    ($) async {
      app.main();

      // Replace later with your app's main widget
      await $.pumpWidgetAndSettle(app.MyApp());

      await $.tap($(#increment));
      await $.tap($(#increment));

      // OSのホームに戻る
      await $.native.pressHome();

      // アプリを起動
      await $.native.openApp();

      await $.tap($(#increment));

      await $.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 3));

      expect($(#counter).text, '3');

      if (!Platform.isMacOS) {
        await $.native.pressHome();
      }
    },
  );
}
