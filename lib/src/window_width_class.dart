import 'package:flutter/material.dart';

/// https://m3.material.io/foundations/layout/applying-layout/window-size-classes
enum WindowWidthClass implements Comparable<WindowWidthClass> {
  compact(breakpoint: _compact, panes: 1, spacing: 16),
  medium(breakpoint: _medium, panes: 1, spacing: 24),
  expanded(breakpoint: _expanded, panes: 2, spacing: 24, fixedPane: 360),
  large(breakpoint: _large, panes: 2, spacing: 24, fixedPane: 412),
  extraLarge(breakpoint: _extraLarge, panes: 2, spacing: 24, fixedPane: 412);

  static const double _compact = 0;
  static const double _medium = 600;
  static const double _expanded = 840;
  static const double _large = 1200;
  static const double _extraLarge = 1600;

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

  /// Fixed pane width.
  ///
  /// Width value used in a fixed and flexible layout.
  ///
  /// https://m3.material.io/foundations/layout/applying-layout/pane-layouts
  final double? fixedPane;

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

  static WindowWidthClass fromWidth(double width) {
    return switch (width) {
      < _medium => WindowWidthClass.compact,
      < _expanded => WindowWidthClass.medium,
      < _large => WindowWidthClass.expanded,
      < _extraLarge => WindowWidthClass.large,
      _ => WindowWidthClass.extraLarge,
    };
  }

  static WindowWidthClass of(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return fromWidth(width);
  }
}
