## 0.1.0

### ⚠️ Breaking Changes
- **Styling Refactor**: Renamed all `Decoration` classes to `Style` for better alignment with Flutter's naming conventions:
  - `M3EDropdownFieldDecoration` -> `M3EDropdownFieldStyle`
  - `M3EDropdownDecoration` -> `M3EDropdownStyle`
  - `M3EChipDecoration` -> `M3EChipStyle`
  - `M3ESearchDecoration` -> `M3ESearchStyle`
  - `M3EDropdownItemDecoration` -> `M3EDropdownItemStyle`
- **Motion API**: Replaced flat `stiffness` and `damping` properties with `openMotion` and `closeMotion` objects of type `M3EMotion`.
- **Haptic Feedback**: Migrated `haptic` property from `int` to `M3EHapticFeedback` enum.
- **Radius Property**: Renamed `expandedBorderRadius` to `selectedBorderRadius` in field styling and changed its type to `double`.

### ✨ New Features
- **Style Standardization**: Added `copyWith`, `lerp`, `operator ==`, and `hashCode` to all style classes.
- **Form Validation Styling**: Added `errorBorder` and `errorStyle` to `M3EDropdownFieldStyle`.
- **Desktop/Web Support**: Added `mouseCursor` customization for field, search, chips, and items.
- **Customization**: Added `clearIcon` parameter to `M3EDropdownFieldStyle`.
- **Empty State**: Added `emptyBuilder` for custom empty states when search/list is empty.
- **Interactive Radius Morphing**: Added snappy (40ms) radius morphing for both field and items.
- **Dual-Speed Animations**: Transitions (20ms) for logical changes and (40ms) for interaction feedback.
- **Premium Interaction Model**: Added subtle background overlay fade (5% hover, 10% press).
- **Granular Ripple Control**: Added `splashFactory`, `splashColor`, and `highlightColor` to `Style` classes.

### 🛠 Improvements & Fixes
- **Animation Stability**: Fixed direction "flipping" and flickering by locking expansion direction during animation.
- **Positioning Logic**: Improved overlay positioning to reactively account for validation error space.
- **Optimized Performance**:
  - Added `ValueKey` to menu items to preserve state.
  - Eliminated redundant `setState` calls using `ListenableBuilder`.
  - Optimized `FlowDelegate` layout passes for chips.
- **Code Health**: Refactored to modular components in `src/widgets/`.
- **Formatting**: Applied `dart format` for a perfect pub.dev score.
- **Documentation**: 100% documentation coverage with library-level docs.

## 0.0.1

* Initial release of `m3e_dropdown_menu`!
