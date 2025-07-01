import 'package:flutter/widgets.dart';
import 'package:material_window_size/src/window_height_class.dart';
import 'package:material_window_size/src/window_width_class.dart';

class WindowSizeClass {
  final WindowHeightClass height;

  final WindowWidthClass width;

  const WindowSizeClass({required this.height, required this.width});

  static WindowSizeClass of(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return WindowSizeClass(
      height: WindowHeightClass.fromHeight(size.height),
      width: WindowWidthClass.fromWidth(size.width),
    );
  }
}
