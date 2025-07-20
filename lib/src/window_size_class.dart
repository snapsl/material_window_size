import 'package:flutter/widgets.dart';
import 'package:material_window_size/src/window_height_class.dart';
import 'package:material_window_size/src/window_width_class.dart';

/// A class that combines [WindowHeightClass] and [WindowWidthClass] to represent the overall window size class.
///
/// See: https://m3.material.io/foundations/layout/applying-layout/window-size-classes
class WindowSizeClass {
  /// The window's height class (e.g., compact, medium, expanded).
  final WindowHeightClass height;

  /// The window's width class (e.g., compact, medium, expanded).
  final WindowWidthClass width;

  /// Creates a [WindowSizeClass] with the given [height] and [width] classes.
  ///
  /// Both [height] and [width] are required and represent the window's size classification.
  const WindowSizeClass({required this.height, required this.width});

  /// Returns the [WindowSizeClass] for the current [BuildContext].
  ///
  /// Example:
  /// ```dart
  /// final windowSize = WindowSizeClass.of(context);
  /// if (windowSize.width < WindowWidthClass.medium) {
  ///   // Handle compact width layout
  /// }
  /// if (windowSize.height < WindowHeightClass.medium) {
  ///   // Handle compact height layout
  /// }
  /// ```
  static WindowSizeClass of(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return WindowSizeClass(
      height: WindowHeightClass.fromHeight(size.height),
      width: WindowWidthClass.fromWidth(size.width),
    );
  }
}
