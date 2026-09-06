# M3E Dropdown Menu

![M3E Intro](https://raw.githubusercontent.com/Mudit200408/m3e_dropdown_menu/main/doc/intro.png)

A comprehensive Flutter package providing an expressive, Material 3 dropdown menu with high-performance spring physics, interactive radius morphing, and extensive customization options. Featuring single and multi-selection, fuzzy search, async loading, and animated chip tags—all designed with premium M3 Expressive principles.

It automatically calculates and draws corners to fit exactly the [Material 3 Expressive](https://m3.material.io/blog/building-with-m3-expressive) spec. It provides deep control over styling, custom haptic feedback, and highly tunable spring motions.

---

## 🚀 Features

- **Keyboard Navigation & Accessibility:** Native keyboard control with <kbd>Enter</kbd> / <kbd>Space</kbd> / <kbd>↓</kbd> to open, <kbd>↑</kbd> / <kbd>↓</kbd> to navigate, <kbd>Enter</kbd> to select, <kbd>Esc</kbd> to dismiss, and <kbd>Backspace</kbd> / <kbd>Delete</kbd> to remove chips.
- **M3E Focus Ring Overlays:** High-precision, zero-layout-impact focus rings with customizable color, stroke width, and gap around fields, menu items, and chips.
- **Spring-Driven Pressed Scale:** Tactile micro-interactions scaling elements smoothly on press with configurable spring motion curves.
- **Interactive Radius Morphing:** Snappy, high-fidelity `BorderRadius` morphing on hover and press for both field and items.
- **Dual-Speed Animations:** Fine-tuned durations (20ms for selection, 40ms for interactions) for an incredibly responsive feel.
- **Premium Interaction Model:** Subtle opacity-based overlay fades that complement structural motion better than standard ripples.
- **Form Integration:** Full support for `FormField` validation with customizable error borders and text styles.
- **Standardized Styling:** All style classes support `copyWith`, `lerp`, and equality operators for easy theme integration.
- **Dynamic Border Radius:** Fluid transitions between field states with animated borders.
- **Rich Interaction:** Spring-driven physics for expanding and collapsing the dropdown menu.
- **Chips & Search:** Built-in multi-selection chip support and fuzzy search input.
- **Highly Customizable:** Complete control over haptics, motion presets, overlay colors, and per-component styling.

---

## 📦 Installation

> [!IMPORTANT]
> **Flutter 3.47+ & `material_ui` Requirement (v1.0.0+)**:
> Starting with `v1.0.0`, `m3e_dropdown_menu` is migrated to use the standalone `material_ui` package decoupled in **Flutter 3.47.0**.
> - Requires Flutter SDK **`>=3.47.0`**.
> - Ensure your app imports `package:material_ui/material_ui.dart` (or run `dart fix --apply --code=migrate_design_widgets`).
> - If you are on Flutter `< 3.47.0`, please use `m3e_dropdown_menu: ^0.1.0`.

Add `m3e_dropdown_menu` and `material_ui` to your `pubspec.yaml`:

```yaml
dependencies:
  material_ui: ^1.0.0
  m3e_dropdown_menu: ^1.0.2
```

```dart
import 'package:material_ui/material_ui.dart';
import 'package:m3e_dropdown_menu/m3e_dropdown_menu.dart';
```

---
## 🧩 Usage

### 🚀 Want to try out the package?
**[Check out the Live Demo here!](https://mudit200408.github.io/m3e_core/)**

### Single-select with Radius Morphing
A basic dropdown selecting one item, featuring interactive radius morphing for a tactile feel.
```dart
M3EDropdownMenu<String>(
  items: [
    M3EDropdownItem(label: 'Apple', value: 'apple'),
    M3EDropdownItem(label: 'Banana', value: 'banana'),
    M3EDropdownItem(label: 'Cherry', value: 'cherry'),
  ],
  singleSelect: true,
  openMotion: M3EMotion.standardSpatialDefault,
  fieldStyle: M3EDropdownFieldStyle(
    hintText: 'Choose a fruit',
    borderRadius: BorderRadius.circular(12),
    selectedBorderRadius: 28,
    hoverRadius: 16,
    pressedRadius: 8,
  ),
  dropdownStyle: const M3EDropdownStyle(containerRadius: 18),
  itemStyle: const M3EDropdownItemStyle(
    outerRadius: 18,
    innerRadius: 6,
    hoverRadius: 8,
    pressedRadius: 4,
  ),
  onSelectionChanged: (items) => print(items),
)
```

### Multi-select + Search + Chips + Custom Motion
Provides a search bar, animated chip display, and custom spring physics.
```dart
M3EDropdownMenu<String>(
  items: fruitItems,
  searchEnabled: true,
  showChipAnimation: true,
  maxSelections: 7,
  openMotion: M3EMotion.custom(stiffness: 500, damping: 0.6),
  fieldStyle: M3EDropdownFieldStyle(
    hintText: 'Pick up to 7 fruits',
    border: BorderSide(color: Theme.of(context).colorScheme.outline),
    showClearIcon: true,
  ),
  chipStyle: M3EChipStyle(
    maxDisplayCount: 3,
    borderRadius: BorderRadius.circular(33),
    openMotion: M3EMotion.expressiveSpatialFast,
    closeMotion: M3EMotion.expressiveSpatialDefault,
  ),
  searchStyle: M3ESearchStyle(
    hintText: 'Search fruits…',
    filled: true,
    borderRadius: BorderRadius.circular(24),
  ),
  onSelectionChanged: (items) => print(items),
)
```

### Form Validation Styling
Easily style validation errors with custom borders and text styles.
```dart
M3EDropdownMenu<String>(
  items: fruitItems,
  validator: (val) => val == null || val.isEmpty ? 'Required field' : null,
  fieldStyle: M3EDropdownFieldStyle(
    errorBorder: const BorderSide(color: Colors.red, width: 2),
    errorStyle: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
  ),
)
```

### Async Data Loading
Loads dropdown items asynchronously via a `Future`.
```dart
M3EDropdownMenu<int>.future(
  future: () async {
    await Future.delayed(const Duration(seconds: 2));
    return List.generate(
      10,
      (i) => M3EDropdownItem(label: 'User ${i + 1}', value: i + 1),
    );
  },
  singleSelect: true,
  fieldStyle: const M3EDropdownFieldStyle(
    hintText: 'Loading users…',
  ),
  onSelectionChanged: (items) => print(items),
)
```

---

## 🛠 API Reference

**`M3EDropdownMenu` Parameters:**
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `items` | `List<M3EDropdownItem<T>>` | **Required** | List of dropdown items. |
| `future` | `M3EDropdownFutureRequest<T>?` | `null` | Async item provider (use `.future()` constructor). |
| `singleSelect` | `bool` | `false` | Limits to a single choice if true. |
| `searchEnabled` | `bool` | `false` | Displays a search bar inside the overlay. |
| `showChipAnimation` | `bool` | `true` | Chips slide / pop when selections change. |
| `maxSelections` | `int` | `0 (Unlimited)` | Maximum allowed selections. |
| `onSelectionChanged` | `ValueChanged<List<M3EDropdownItem<T>>>?` | `null` | Called whenever the selection changes. |
| `onSearchChanged` | `ValueChanged<String>?` | `null` | Called when the search text changes. |
| `controller` | `M3EDropdownController<T>?` | `null` | Optional programmatic controller. |
| `enabled` | `bool` | `true` | Whether the dropdown is enabled. |
| `containerRadius` | `double` | `28.0` | Radius for the dropdown panel and field (when no field radius is set). |
| `fieldStyle` | `M3EDropdownFieldStyle` | `const` | Stylize the field placeholder, radii, and interactions. |
| `dropdownStyle` | `M3EDropdownStyle` | `const` | Stylize the overlay panel height, colors, and shadow. |
| `chipStyle` | `M3EChipStyle` | `const` | Stylize the chips, spacing, and animations. |
| `searchStyle` | `M3ESearchStyle` | `const` | Stylize the search field inside the dropdown. |
| `itemStyle` | `M3EDropdownItemStyle` | `const` | Stylize individual dropdown items and their morphing. |
| `openMotion` | `M3EMotion` | `expressiveSpatialDefault` | Spring physics for expansion/selection transitions. |
| `closeMotion` | `M3EMotion` | `expressiveSpatialDefault` | Spring physics for collapse transitions. |
| `haptic` | `M3EHapticFeedback` | `none` | Haptic feedback intensity on tap. |
| `itemBuilder` | `M3EDropdownItemBuilder<T>?` | `null` | Custom builder for each dropdown item. |
| `emptyBuilder` | `WidgetBuilder?` | `null` | Custom builder for the empty state when no items are found. |
| `selectedItemBuilder` | `Widget Function(M3EDropdownItem<T>)?` | `null` | Custom builder for selected items in the field. |

**`M3EDropdownFieldStyle` Parameters:**
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `borderRadius` | `BorderRadius?` | - | Resting radius of the field. |
| `selectedBorderRadius` | `double?` | - | Radius when the dropdown is expanded. |
| `hoverRadius` | `double?` | - | Radius used when the field is hovered. |
| `pressedRadius` | `double?` | - | Radius used when the field is pressed. |
| `pressedScale` | `double?` | `null` | Scale factor applied to field content when pressed (e.g. `0.98`). |
| `pressedMotion` | `M3EMotion` | `expressiveSpatialFast` | Spring motion used for the pressed scale animation. |
| `focusRingColor` | `Color?` | - | Custom focus ring color (defaults to `ColorScheme.primary`). |
| `focusRingWidth` | `double` | `2.0` | Stroke width of the focus ring. |
| `focusRingGap` | `double` | `0.0` | Gap between the field border and focus ring. |
| `splashFactory` | `InteractiveInkFeatureFactory?` | `NoSplash` | Type of splash effect for tap feedback (e.g. `InkSparkle.splashFactory`). |
| `errorBorder` | `BorderSide?` | - | Border used when validation fails. |
| `errorStyle` | `TextStyle?` | - | Style for the validation error text. |
| `mouseCursor` | `MouseCursor?` | `SystemMouseCursors.click` | Cursor used when hovering. |
| `showArrow` | `bool` | `true` | Shows default animated chevron. |
| `showClearIcon` | `bool` | `false` | Shows clear-all icon when selections exist. |
| `clearIcon` | `Widget?` | - | Custom widget for the clear-all icon. |

**`M3EDropdownItemStyle` Parameters:**
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `outerRadius` | `double?` | `12.0` | Radius for the "cap" corners of the first/last items. |
| `innerRadius` | `double` | `6.0` | Base radius for internal item corners. |
| `hoverRadius` | `double` | `8.0` | Radius used when an item is hovered. |
| `pressedRadius` | `double` | `4.0` | Radius used when an item is pressed. |
| `pressedScale` | `double?` | `null` | Scale factor applied to item content when pressed (e.g. `0.98`). |
| `pressedMotion` | `M3EMotion` | `expressiveSpatialFast` | Spring motion used for the pressed scale animation. |
| `focusRingColor` | `Color?` | - | Custom focus ring color (defaults to `ColorScheme.primary`). |
| `focusRingWidth` | `double` | `2.0` | Stroke width of the focus ring. |
| `focusRingGap` | `double` | `0.0` | Gap between the item border and focus ring. |
| `selectedBorderRadius` | `double?` | - | Radius used when an item is selected. |
| `mouseCursor` | `MouseCursor?` | - | Cursor used when hovering over an item. |
| `backgroundColor` / `textColor` | `Color?` | - | Colors for the items. |
| `selectedBackgroundColor` / `selectedTextColor` | `Color?` | - | Colors for items when selected. |

**`M3EChipStyle` Parameters:**
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `borderRadius` | `BorderRadius` | `BorderRadius.circular(20)` | Resting radius of the chips. |
| `spacing` / `runSpacing` | `double` | `6.0` / `6.0` | Spacing between chips horizontally and vertically. |
| `maxDisplayCount` | `int?` | `null` | Maximum visible chips before showing "+N more". |
| `pressedScale` | `double?` | `null` | Scale factor applied to chip when pressed (e.g. `0.95`). |
| `pressedMotion` | `M3EMotion` | `expressiveSpatialFast` | Spring motion used for the pressed scale animation. |
| `focusRingColor` | `Color?` | - | Custom focus ring color (defaults to `ColorScheme.primary`). |
| `focusRingWidth` | `double` | `2.0` | Stroke width of the focus ring. |
| `focusRingGap` | `double` | `0.0` | Gap between the chip and focus ring. |
| `mouseCursor` | `MouseCursor?` | - | Cursor used when hovering over chips. |
| `openMotion` / `closeMotion` | `M3EMotion` | `expressiveSpatialDefault` | Spring motions for chip entry and exit animations. |

---

### 🎯 Check the [Example](https://github.com/Mudit200408/m3e_dropdown_menu/tree/main/example) App for more details. 

---
## 🐞 Found a bug? or ✨ You have a Feature Request?

Feel free to open a [Issue](https://github.com/Mudit200408/m3e_dropdown_menu/issues) or [Contribute](https://github.com/Mudit200408/m3e_dropdown_menu/pulls) to the project.

Hope You Love It!

----
## Credits
- [Motor](https://pub.dev/packages/motor) Pub Package for Expressive Animations
- Claude and Gemini for helping me with the code and documentation.

### Radhe Radhe 🙏
