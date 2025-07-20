# material_window_size

A Flutter package that provides Material 3 window size classes for responsive layouts. Easily determine the width and height class of your app window to build adaptive UIs across devices.

## Features

- Detects window width and height classes based on Material 3 guidelines
- Provides enums for width (`WindowWidthClass`) and height (`WindowHeightClass`)
- Utility methods for querying size classes from `BuildContext`
- Constants for Material 3 layout breakpoints and side sheet widths

## Getting started

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  material_window_size: ^0.1.0
```

Import the package:

```dart
import 'package:material_window_size/material_window_size.dart';
```

## Usage

Query the window size class in your widget tree:

```dart
import 'package:flutter/material.dart';
import 'package:material_window_size/material_window_size.dart';

@override
Widget build(BuildContext context) {
  final windowSize = WindowSizeClass.of(context);

  if (windowSize.width < WindowWidthClass.medium) {
    // Handle compact width layout
  }
  if (windowSize.height < WindowHeightClass.medium) {
    // Handle compact height layout
  }

  // Using pattern matching
  return switch (windowSize.width) {
    WindowWidthClass.compact => CompactView(),
    WindowWidthClass.medium => MediumView(),
    WindowWidthClass.expanded => ExpandedView(),
    WindowWidthClass.large => LargeView(),
    WindowWidthClass.extraLarge => ExtraLargeView(),
  };
}
```

## Additional information

- [Material 3 Window Size Classes](https://m3.material.io/foundations/layout/applying-layout/window-size-classes)
- [Material 3 Layout Guidelines](https://m3.material.io/foundations/layout/understanding-layout/overview)

Contributions, issues, and suggestions are welcome! Please open an issue or pull request on GitHub.
