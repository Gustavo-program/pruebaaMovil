// @dart=2.7

import 'dart:ui' as ui;

import 'package:cl3_marianoroman/main.dart' as entrypoint;

Future<void> main() async {
  await ui.webOnlyInitializePlatform();
  entrypoint.main();
}
