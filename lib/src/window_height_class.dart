import 'package:flutter/material.dart';

enum WindowHeightClass implements Comparable<WindowHeightClass> {
  /// Compact window height class
  ///
  /// height < 480
  compact(breakpoint: _smallBp),

  /// Medium window height class
  ///
  /// 480dp ≤ height < 900dp
  medium(breakpoint: _mediumBp),

  /// Expanded window height class
  ///
  /// height ≥ 900dp
  expanded(breakpoint: _expanded);

  static const double _smallBp = 0;
  static const double _mediumBp = 480;
  static const double _expanded = 900;

  final double breakpoint;

  const WindowHeightClass({required this.breakpoint});

  bool operator <(WindowHeightClass other) => index < other.index;
  bool operator <=(WindowHeightClass other) => index <= other.index;
  bool operator >(WindowHeightClass other) => index > other.index;
  bool operator >=(WindowHeightClass other) => index >= other.index;

  @override
  int compareTo(WindowHeightClass other) => index.compareTo(other.index);

  static WindowHeightClass fromHeight(double height) {
    return switch (height) {
      < _mediumBp => WindowHeightClass.compact,
      < _expanded => WindowHeightClass.medium,
      _ => WindowHeightClass.expanded,
    };
  }

  static WindowHeightClass of(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).height;

    return fromHeight(screenWidth);
  }
}
