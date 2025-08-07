import '../models/shop_model.dart';

class MockShops {
  static List<Shop> getAllShops() {
    return [
      Shop(
        id: '1',
        name: 'The Daily Grind',
        description: 'Artisanal coffee roasted daily with locally sourced beans. A cozy atmosphere perfect for work or relaxation.',
        address: '123 Main St, Downtown, NY 10001',
        imageUrl: 'https://images.unsplash.com/photo-1501339847302-ac426a4a7cbb?w=500&h=300&fit=crop',
        rating: 4.8,
        hours: 'Mon-Fri: 6:00 AM - 8:00 PM\nSat-Sun: 7:00 AM - 9:00 PM',
        latitude: 40.7589,
        longitude: -73.9851,
        phone: '(555) 123-4567',
        features: ['WiFi', 'Outdoor Seating', 'Pastries', 'Vegan Options'],
      ),
      Shop(
        id: '2',
        name: 'Blue Mountain Coffee',
        description: 'Premium Jamaica Blue Mountain coffee served in an elegant setting with mountain views.',
        address: '456 Hill Road, Uptown, NY 10002',
        imageUrl: 'https://images.unsplash.com/photo-1554118811-1e0d58224f24?w=500&h=300&fit=crop',
        rating: 4.6,
        hours: 'Mon-Sun: 7:00 AM - 7:00 PM',
        latitude: 40.7831,
        longitude: -73.9712,
        phone: '(555) 234-5678',
        features: ['WiFi', 'Live Music', 'Rooftop Seating', 'Organic'],
      ),
      Shop(
        id: '3',
        name: 'Urban Bean',
        description: 'Modern coffee house with industrial design, perfect for digital nomads and coffee enthusiasts.',
        address: '789 Tech Ave, Midtown, NY 10003',
        imageUrl: 'https://images.unsplash.com/photo-1445116572660-236099ec97a0?w=500&h=300&fit=crop',
        rating: 4.7,
        hours: 'Mon-Fri: 5:30 AM - 10:00 PM\nSat-Sun: 6:00 AM - 10:00 PM',
        latitude: 40.7505,
        longitude: -73.9934,
        phone: '(555) 345-6789',
        features: ['WiFi', '24/7 Access', 'Study Areas', 'Cold Brew'],
      ),
      Shop(
        id: '4',
        name: 'Sunrise Café',
        description: 'Family-owned café serving traditional coffee with homemade pastries since 1985.',
        address: '321 Heritage Lane, Brooklyn, NY 11201',
        imageUrl: 'https://images.unsplash.com/photo-1559925393-8be0ec4767c8?w=500&h=300&fit=crop',
        rating: 4.5,
        hours: 'Mon-Sat: 6:00 AM - 6:00 PM\nSun: 7:00 AM - 5:00 PM',
        latitude: 40.6892,
        longitude: -73.9442,
        phone: '(555) 456-7890',
        features: ['Family Owned', 'Homemade Pastries', 'Traditional', 'Pet Friendly'],
      ),
      Shop(
        id: '5',
        name: 'Espresso Central',
        description: 'High-energy coffee bar specializing in espresso drinks and quick service for busy professionals.',
        address: '654 Business Blvd, Financial District, NY 10004',
        imageUrl: 'https://images.unsplash.com/photo-1442512595331-e89e73853f31?w=500&h=300&fit=crop',
        rating: 4.4,
        hours: 'Mon-Fri: 5:00 AM - 7:00 PM\nSat: 7:00 AM - 4:00 PM\nSun: Closed',
        latitude: 40.7074,
        longitude: -74.0113,
        phone: '(555) 567-8901',
        features: ['Quick Service', 'Loyalty Program', 'Mobile Orders', 'Espresso Bar'],
      ),
      Shop(
        id: '6',
        name: 'Green Leaf Coffee',
        description: 'Eco-friendly coffee shop committed to sustainability with fair-trade and organic options.',
        address: '987 Eco Street, Greenwich Village, NY 10014',
        imageUrl: 'https://images.unsplash.com/photo-1447933601403-0c6688de566e?w=500&h=300&fit=crop',
        rating: 4.9,
        hours: 'Mon-Sun: 6:30 AM - 8:30 PM',
        latitude: 40.7356,
        longitude: -74.0023,
        phone: '(555) 678-9012',
        features: ['Organic', 'Fair Trade', 'Eco-Friendly', 'Plant-Based Milk'],
      ),
      Shop(
        id: '7',
        name: 'Midnight Brew',
        description: 'Late-night coffee spot perfect for night owls, students, and shift workers.',
        address: '159 Night Owl Ave, East Village, NY 10009',
        imageUrl: 'https://images.unsplash.com/photo-1453614512568-c4024d13c247?w=500&h=300&fit=crop',
        rating: 4.3,
        hours: 'Mon-Thu: 4:00 PM - 2:00 AM\nFri-Sat: 4:00 PM - 3:00 AM\nSun: 4:00 PM - 12:00 AM',
        latitude: 40.7282,
        longitude: -73.9942,
        phone: '(555) 789-0123',
        features: ['Late Hours', 'Study Space', 'Live Events', 'Board Games'],
      ),
      Shop(
        id: '8',
        name: 'Artisan Roasters',
        description: 'Small-batch coffee roastery where you can watch the roasting process and taste fresh beans.',
        address: '753 Craft Road, SoHo, NY 10013',
        imageUrl: 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=500&h=300&fit=crop',
        rating: 4.7,
        hours: 'Mon-Fri: 7:00 AM - 6:00 PM\nSat-Sun: 8:00 AM - 7:00 PM',
        latitude: 40.7209,
        longitude: -74.0007,
        phone: '(555) 890-1234',
        features: ['Small Batch', 'Roastery Tours', 'Bean Sales', 'Tasting Events'],
      ),
    ];
  }

  static List<Shop> searchShops(String query) {
    if (query.isEmpty) return getAllShops();
    
    return getAllShops().where((shop) {
      return shop.name.toLowerCase().contains(query.toLowerCase()) ||
             shop.description.toLowerCase().contains(query.toLowerCase()) ||
             shop.address.toLowerCase().contains(query.toLowerCase()) ||
             shop.features.any((feature) => feature.toLowerCase().contains(query.toLowerCase()));
    }).toList();
  }
}