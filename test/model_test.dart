import 'package:flutter_test/flutter_test.dart';
import 'package:coffee_shop_finder/models/shop_model.dart';
import 'package:coffee_shop_finder/data/mock_shops.dart';

void main() {
  group('Shop Model Tests', () {
    test('Shop model creation and serialization', () {
      final shop = Shop(
        id: 'test1',
        name: 'Test Coffee Shop',
        description: 'A test coffee shop',
        address: '123 Test St',
        imageUrl: 'https://example.com/image.jpg',
        rating: 4.5,
        hours: 'Mon-Fri: 9-5',
        latitude: 40.7589,
        longitude: -73.9851,
        phone: '(555) 123-4567',
        features: ['WiFi', 'Outdoor Seating'],
      );

      expect(shop.name, 'Test Coffee Shop');
      expect(shop.rating, 4.5);
      expect(shop.features.length, 2);
      expect(shop.features.contains('WiFi'), true);

      // Test serialization
      final map = shop.toMap();
      expect(map['name'], 'Test Coffee Shop');
      expect(map['rating'], 4.5);

      // Test deserialization
      final shopFromMap = Shop.fromMap(map);
      expect(shopFromMap.name, shop.name);
      expect(shopFromMap.rating, shop.rating);
      expect(shopFromMap.features.length, shop.features.length);
    });

    test('Mock shops data integrity', () {
      final shops = MockShops.getAllShops();
      
      expect(shops.isNotEmpty, true);
      expect(shops.length, greaterThan(5));

      for (final shop in shops) {
        expect(shop.id.isNotEmpty, true);
        expect(shop.name.isNotEmpty, true);
        expect(shop.address.isNotEmpty, true);
        expect(shop.phone.isNotEmpty, true);
        expect(shop.rating, greaterThanOrEqualTo(0));
        expect(shop.rating, lessThanOrEqualTo(5));
        expect(shop.latitude, isNotNull);
        expect(shop.longitude, isNotNull);
        expect(shop.features.isNotEmpty, true);
      }
    });

    test('Search functionality', () {
      final allShops = MockShops.getAllShops();
      
      // Test empty search returns all shops
      final emptySearch = MockShops.searchShops('');
      expect(emptySearch.length, allShops.length);

      // Test name search
      final nameSearch = MockShops.searchShops('Blue Mountain');
      expect(nameSearch.isNotEmpty, true);
      expect(nameSearch.any((shop) => shop.name.contains('Blue Mountain')), true);

      // Test feature search
      final featureSearch = MockShops.searchShops('WiFi');
      expect(featureSearch.isNotEmpty, true);
      expect(featureSearch.every((shop) => 
        shop.features.any((feature) => feature.toLowerCase().contains('wifi'))), true);

      // Test non-existent search
      final noResults = MockShops.searchShops('XYZ123NotFound');
      expect(noResults.isEmpty, true);
    });
  });
}