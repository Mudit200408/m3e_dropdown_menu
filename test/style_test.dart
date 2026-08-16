import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:m3e_dropdown_menu/m3e_dropdown_menu.dart';

void main() {
  group('M3EDropdownFieldStyle Tests', () {
    test('copyWith works correctly', () {
      const style = M3EDropdownFieldStyle(hintText: 'Initial');
      final updated = style.copyWith(hintText: 'Updated');
      expect(updated.hintText, 'Updated');
      expect(style.hintText, 'Initial');
    });

    test('operator == and hashCode work correctly', () {
      const style1 = M3EDropdownFieldStyle(hintText: 'Test');
      const style2 = M3EDropdownFieldStyle(hintText: 'Test');
      const style3 = M3EDropdownFieldStyle(hintText: 'Different');

      expect(style1, style2);
      expect(style1.hashCode, style2.hashCode);
      expect(style1, isNot(style3));
    });

    test('lerp works correctly', () {
      const styleA = M3EDropdownFieldStyle(backgroundColor: Colors.red);
      const styleB = M3EDropdownFieldStyle(backgroundColor: Colors.blue);

      final lerped = M3EDropdownFieldStyle.lerp(styleA, styleB, 0.5);
      expect(lerped.backgroundColor, Color.lerp(Colors.red, Colors.blue, 0.5));
    });
  });

  group('M3EDropdownStyle Tests', () {
    test('copyWith works correctly', () {
      const style = M3EDropdownStyle(elevation: 1);
      final updated = style.copyWith(elevation: 5);
      expect(updated.elevation, 5);
    });

    test('lerp works correctly', () {
      const styleA = M3EDropdownStyle(elevation: 0);
      const styleB = M3EDropdownStyle(elevation: 10);

      final lerped = M3EDropdownStyle.lerp(styleA, styleB, 0.5);
      expect(lerped.elevation, 5.0);
    });
  });

  group('M3EChipStyle Tests', () {
    test('copyWith works correctly', () {
      const style = M3EChipStyle(spacing: 4);
      final updated = style.copyWith(spacing: 8);
      expect(updated.spacing, 8);
    });

    test('lerp works correctly', () {
      const styleA = M3EChipStyle(spacing: 0);
      const styleB = M3EChipStyle(spacing: 10);

      final lerped = M3EChipStyle.lerp(styleA, styleB, 0.5);
      expect(lerped.spacing, 5.0);
    });
  });

  group('M3ESearchStyle Tests', () {
    test('copyWith works correctly', () {
      const style = M3ESearchStyle(hintText: 'Search');
      final updated = style.copyWith(hintText: 'Find');
      expect(updated.hintText, 'Find');
    });

    test('lerp works correctly', () {
      const styleA = M3ESearchStyle(searchDebounceMs: 0);
      const styleB = M3ESearchStyle(searchDebounceMs: 1000);

      final lerped = M3ESearchStyle.lerp(styleA, styleB, 0.5);
      expect(lerped.searchDebounceMs, 500);
    });
  });

  group('M3EDropdownItemStyle Tests', () {
    test('copyWith works correctly', () {
      const style = M3EDropdownItemStyle(innerRadius: 4);
      final updated = style.copyWith(innerRadius: 8);
      expect(updated.innerRadius, 8);
    });

    test('lerp works correctly', () {
      const styleA = M3EDropdownItemStyle(innerRadius: 0);
      const styleB = M3EDropdownItemStyle(innerRadius: 10);

      final lerped = M3EDropdownItemStyle.lerp(styleA, styleB, 0.5);
      expect(lerped.innerRadius, 5.0);
    });
  });
}
