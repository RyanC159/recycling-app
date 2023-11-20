import 'package:test/test.dart';
import '../../lib/mocks/mock_home.dart';

void main() {
  test('test fetchAny', () {
    final mockHome = MockHome.fetchAny();
    expect(mockHome, isNotNull);
    expect(mockHome.name, isNotEmpty);
    expect(mockHome.imageUrl, isNotEmpty);
  });

  test('test fetchAll', () {
    final mockHome = MockHome.fetchAll();
    expect(mockHome.length, greaterThan(0));
    expect(mockHome[0].name, isNotEmpty);
  });

  test('test fetch', () {
    final mockHome = MockHome.fetch(0);
    expect(mockHome, isNotNull);
    expect(mockHome.name, isNotEmpty);
  });
}
