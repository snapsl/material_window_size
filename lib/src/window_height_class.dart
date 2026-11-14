import 'package:flutter/widgets.dart';

/// An enum that represents the window height class according to Material 3 guidelines.
///
/// See: https://m3.material.io/foundations/layout/applying-layout/window-size-classes
enum WindowHeightClass implements Comparable<WindowHeightClass> {
  /// Compact window height class
  ///
  /// height < 480
  compact(breakpoint: _compact),

  /// Medium window height class
  ///
  /// 480dp ≤ height < 900dp
  medium(breakpoint: _medium),

  /// Expanded window height class
  ///
  /// height ≥ 900dp
  expanded(breakpoint: _expanded);

  static const double _compact = .negativeInfinity;
  static const double _medium = 480;
  static const double _expanded = 900;

  /// The breakpoint value for the [WindowHeightClass].
  ///
  /// Represents the minimum height in dp for this class.
  final double breakpoint;

  /// Creates a [WindowHeightClass] with the given [breakpoint].
  const WindowHeightClass({required this.breakpoint});

  /// Returns the [WindowHeightClass] for a given height in dp.
  ///
  /// Example:
  /// ```dart
  /// final heightClass = WindowHeightClass.fromHeight(500);
  /// // heightClass == WindowHeightClass.medium
  /// ```
  factory fromHeight(double height) {
    return switch (height) {
      >= _expanded => .expanded,
      >= _medium => .medium,
      _ => .compact,
    };
  }

  /// Returns the [WindowHeightClass] for the current [BuildContext].
  ///
  /// Example:
  /// ```dart
  /// final heightClass = WindowHeightClass.of(context);
  /// if (heightClass < WindowHeightClass.medium) {
  ///   // Handle compact height layout
  /// }
  /// ```
  factory of(BuildContext context) {
    final height = MediaQuery.heightOf(context);

    return .fromHeight(height);
  }

  /// Whether this [WindowHeightClass] is less than [other].
  bool operator <(WindowHeightClass other) => index < other.index;

  /// Whether this [WindowHeightClass] is less than or equal to [other].
  bool operator <=(WindowHeightClass other) => index <= other.index;

  /// Whether this [WindowHeightClass] is greater than [other].
  bool operator >(WindowHeightClass other) => index > other.index;

  /// Whether this [WindowHeightClass] is greater than or equal to [other].
  bool operator >=(WindowHeightClass other) => index >= other.index;

  /// Compares this [WindowHeightClass] with another [WindowHeightClass].
  @override
  int compareTo(WindowHeightClass other) => index.compareTo(other.index);
}
