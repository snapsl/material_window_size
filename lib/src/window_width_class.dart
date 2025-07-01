import 'package:flutter/material.dart';

/// https://m3.material.io/foundations/layout/applying-layout/window-size-classes
enum WindowWidthClass implements Comparable<WindowWidthClass> {
  compact(breakpoint: _smallWidthBp, panes: 1, spacing: 16),
  medium(breakpoint: _mediumWidthBp, panes: 1, spacing: 24),
  expanded(breakpoint: _expandedWidthBp, panes: 2, spacing: 24),
  large(breakpoint: _largeWidthBp, panes: 2, spacing: 24),
  extraLarge(breakpoint: _extraLargeWidthBp, panes: 2, spacing: 24);

  static const double _smallWidthBp = 0;
  static const double _mediumWidthBp = 600;
  static const double _expandedWidthBp = 840;
  static const double _largeWidthBp = 1200;
  static const double _extraLargeWidthBp = 1600;

  /// The Breakpoint of the [WindowWidthClass].
  ///
  ///
  final double breakpoint;

  /// Recommended number of panes.
  final int panes;

  /// Recommended spacing.
  ///
  /// The spacing is applied for margins and spacers.
  ///
  /// https://m3.material.io/foundations/layout/understanding-layout/spacing
  final double spacing;

  const WindowWidthClass({
    required this.breakpoint,
    required this.panes,
    required this.spacing,
  });

  bool operator <(WindowWidthClass other) => index < other.index;
  bool operator <=(WindowWidthClass other) => index <= other.index;
  bool operator >(WindowWidthClass other) => index > other.index;
  bool operator >=(WindowWidthClass other) => index >= other.index;

  @override
  int compareTo(WindowWidthClass other) => index.compareTo(other.index);

  static WindowWidthClass fromWidth(double width) {
    return switch (width) {
      < _mediumWidthBp => WindowWidthClass.compact,
      < _expandedWidthBp => WindowWidthClass.medium,
      < _largeWidthBp => WindowWidthClass.expanded,
      < _extraLargeWidthBp => WindowWidthClass.large,
      _ => WindowWidthClass.extraLarge,
    };
  }

  static WindowWidthClass of(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return fromWidth(screenWidth);
  }
}
