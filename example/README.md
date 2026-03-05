# M3E Dropdown Menu Example App

![M3E Intro](https://raw.githubusercontent.com/Mudit200408/m3e_dropdown_menu/main/doc/intro.png)

This example app demonstrates the various features and configurations of the `m3e_dropdown_menu` package.

## 1. Single-select Dropdown
A basic dropdown selecting one item with animated border radii.
```dart
M3EDropdownMenu<String>(
  items: items,
  singleSelect: true,
  onSelectionChanged: (selected) {},
)
```

## 2. Multi-select + Search + Chips
Provides a search bar and displays selected items as animated chips within the dropdown field.
```dart
M3EDropdownMenu<String>(
  items: items,
  searchEnabled: true,
  showChipAnimation: true,
  maxSelections: 7,
  fieldDecoration: M3EDropdownFieldDecoration(showClearIcon: true),
  onSelectionChanged: (selected) {},
)
```

## 3. With Form Validation
Integrates seamlessly with Flutter's standard `Form` and validations.
```dart
M3EDropdownMenu<String>(
  items: items,
  singleSelect: true,
  validator: (selected) {
    if (selected == null || selected.isEmpty) return 'Required';
    return null;
  },
  autovalidateMode: AutovalidateMode.onUserInteraction,
  onSelectionChanged: (selected) {},
)
```

## 4. Custom Selected Item Builder
Allows building a custom representation for the selected items (e.g., custom designed chips).
```dart
M3EDropdownMenu<String>(
  items: items,
  showChipAnimation: true,
  selectedItemBuilder: (item) {
    return Chip(
      avatar: Icon(Icons.check_circle),
      label: Text(item.label),
    );
  },
  onSelectionChanged: (selected) {},
)
```

## 5. Async Data Loading
Loads dropdown items asynchronously via a `Future`.
```dart
M3EDropdownMenu<int>.future(
  future: () async {
    await Future.delayed(Duration(seconds: 2));
    return fetchedItems;
  },
  singleSelect: true,
  fieldDecoration: M3EDropdownFieldDecoration(hintText: 'Loading…'),
  onSelectionChanged: (selected) {},
)
```
