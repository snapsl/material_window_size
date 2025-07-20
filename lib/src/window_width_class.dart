import 'package:flutter/material.dart';

/// An enum that represents the window width class according to Material 3 guidelines.
///
/// See: https://m3.material.io/foundations/layout/applying-layout/window-size-classes
enum WindowWidthClass implements Comparable<WindowWidthClass> {
  /// Compact window width class
  ///
  /// width < 600dp
  compact(breakpoint: _compact, panes: 1, spacing: 16),

  /// Medium window width class
  ///
  /// 600dp ≤ width < 840dp
  medium(breakpoint: _medium, panes: 1, spacing: 24),

  /// Expanded window width class
  ///
  /// 840dp ≤ width < 1200dp
  expanded(breakpoint: _expanded, panes: 2, spacing: 24, fixedPane: 360),

  /// Large window width class
  ///
  /// 1200dp ≤ width < 1600dp
  large(breakpoint: _large, panes: 2, spacing: 24, fixedPane: 412),

  /// Extra large window width class
  ///
  /// width ≥ 1600dp
  extraLarge(breakpoint: _extraLarge, panes: 2, spacing: 24, fixedPane: 412);

  static const double _compact = 0;
  static const double _medium = 600;
  static const double _expanded = 840;
  static const double _large = 1200;
  static const double _extraLarge = 1600;

  /// The breakpoint value for the [WindowWidthClass].
  ///
  /// Represents the minimum width in dp for this class.
  final double breakpoint;

  /// Recommended number of panes.
  final int panes;

  /// Recommended spacing.
  ///
  /// The spacing is applied for margins and spacers.
  ///
  /// https://m3.material.io/foundations/layout/understanding-layout/spacing
  final double spacing;

  /// Fixed pane width.
  ///
  /// Width value used in a fixed and flexible layout.
  ///
  /// https://m3.material.io/foundations/layout/applying-layout/pane-layouts
  final double? fixedPane;

  /// Creates a [WindowWidthClass] with the given
  /// [breakpoint], [panes], [spacing], and optional [fixedPane].
  const WindowWidthClass({
    required this.breakpoint,
    required this.panes,
    required this.spacing,
    this.fixedPane,
  });

  bool operator <(WindowWidthClass other) => index < other.index;
  bool operator <=(WindowWidthClass other) => index <= other.index;
  bool operator >(WindowWidthClass other) => index > other.index;
  bool operator >=(WindowWidthClass other) => index >= other.index;

  @override
  int compareTo(WindowWidthClass other) => index.compareTo(other.index);

  /// Returns the [WindowWidthClass] for a given width in dp.
  ///
  /// Example:
  /// ```dart
  /// final widthClass = WindowWidthClass.fromWidth(700);
  /// // widthClass == WindowWidthClass.medium
  /// ```
  static WindowWidthClass fromWidth(double width) {
    return switch (width) {
      < _medium => WindowWidthClass.compact,
      < _expanded => WindowWidthClass.medium,
      < _large => WindowWidthClass.expanded,
      < _extraLarge => WindowWidthClass.large,
      _ => WindowWidthClass.extraLarge,
    };
  }

  /// Returns the [WindowWidthClass] for the current [BuildContext].
  ///
  /// Example:
  /// ```dart
  /// final windowWidth = WindowWidthClass.of(context);
  /// if (windowWidth < WindowWidthClass.medium) {
  ///   // Handle compact layout
  /// }
  /// ```
  static WindowWidthClass of(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return fromWidth(width);
  }
}
