# m3e_dropdown_menu_example

A comprehensive example project demonstrating the features of the `m3e_dropdown_menu` package.

## Features Shown

- **Single-select**: Basic usage with `selectedBorderRadius`.
- **Multi-select**: Animated chips with custom `openMotion` and `closeMotion`.
- **Search**: Fuzzy search with debounced filtering.
- **Form Integration**: Using `M3EDropdownMenu` inside a `Form` with a `validator`.
- **Async Loading**: Fetching items from a mock API using the `.future()` constructor.
- **Custom Styling**: Overriding colors, radii, and haptic feedback levels.

## Running the Example

1. Clone the repository.
2. Navigate to the `example` directory: `cd example`.
3. Run `flutter pub get`.
4. Run the app: `flutter run`.

## Code Snippets

### Basic Usage
```dart
M3EDropdownMenu<String>(
  items: [
    M3EDropdownItem(label: 'Apple', value: 'apple'),
    M3EDropdownItem(label: 'Banana', value: 'banana'),
  ],
  fieldStyle: M3EDropdownFieldStyle(
    hintText: 'Choose a fruit',
    borderRadius: BorderRadius.circular(12),
  ),
  onSelectionChanged: (items) => print(items),
)
```

### Advanced Styling
```dart
M3EDropdownMenu<String>(
  items: fruitItems,
  fieldStyle: M3EDropdownFieldStyle(
    selectedBorderRadius: 28,
    hoverRadius: 16,
    pressedRadius: 8,
    showClearIcon: true,
  ),
  itemStyle: M3EDropdownItemStyle(
    outerRadius: 18,
    innerRadius: 6,
    hoverRadius: 8,
    pressedRadius: 4,
  ),
  openMotion: M3EMotion.expressiveSpatialFast,
)
```
