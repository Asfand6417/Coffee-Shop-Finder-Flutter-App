# Coffee Shop Finder Flutter App

A beautiful, fully functional Flutter app for finding coffee shops with a modern dark theme UI. Perfect for iOS and Android platforms.

## Features

### 🏪 Shop Discovery
- **Grid Layout**: Browse coffee shops in an intuitive 2-column grid
- **Search Functionality**: Find shops by name, description, address, or features
- **Real-time Filtering**: Instant search results as you type
- **Shop Counter**: See how many shops match your search

### ☕ Detailed Shop Information
- **High-Quality Images**: Each shop features beautiful imagery
- **Comprehensive Details**: Address, phone, hours, and description
- **Interactive Ratings**: Star ratings with precise scoring
- **Feature Tags**: Quick overview of amenities (WiFi, Outdoor Seating, etc.)

### 🗺️ Location Services
- **Interactive Maps**: View shop location with OpenStreetMap integration
- **Custom Markers**: Coffee-themed location pins
- **Get Directions**: One-tap navigation to Google Maps
- **Phone Integration**: Direct calling from the app

### 🎨 Modern Dark UI
- **Consistent Dark Theme**: Easy on the eyes with coffee-inspired colors
- **Smooth Navigation**: Intuitive app flow with material design
- **Responsive Layout**: Optimized for all screen sizes
- **Beautiful Cards**: Elevated design with proper spacing and shadows

### 📱 Cross-Platform
- **iOS Support**: Full iOS compatibility with native feel
- **Android Support**: Material Design following Android guidelines
- **Performance Optimized**: Smooth scrolling and fast navigation

## Technical Stack

- **Flutter Framework**: Cross-platform mobile development
- **Material Design 3**: Modern design system
- **OpenStreetMap**: Free map tiles via flutter_map
- **URL Launcher**: Phone and maps integration
- **Custom Widgets**: Reusable components for consistency

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_map: ^6.1.0           # Interactive maps
  flutter_rating_bar: ^4.0.1    # Star ratings
  url_launcher: ^6.2.1          # Phone/Maps integration
  latlong2: ^0.9.0              # Coordinate handling
  cupertino_icons: ^1.0.2       # iOS-style icons
```

## Project Structure

```
lib/
├── data/
│   └── mock_shops.dart        # Sample coffee shop data
├── models/
│   └── shop_model.dart        # Shop data model
├── screens/
│   ├── shop_detail_page.dart  # Detailed shop view
│   └── shops_list_page.dart   # Main shop listing
├── widgets/
│   └── shop_grid_item.dart    # Shop card component
└── main.dart                  # App entry point & theme
```

## Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/Asfand6417/Coffee-Shop-Finder-Flutter-App.git
   cd Coffee-Shop-Finder-Flutter-App
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

4. **Build for production**
   ```bash
   # Android APK
   flutter build apk --release
   
   # iOS IPA (requires macOS and Xcode)
   flutter build ios --release
   ```

## Features Showcase

### Main Screen
- Clean grid layout with shop cards
- Real-time search with results counter
- Smooth scrolling and navigation
- Dark theme throughout

### Shop Details
- Hero image transitions
- Comprehensive shop information
- Interactive map with custom markers
- Quick action buttons (call, directions)
- Feature chips and rating display

### Navigation
- Smooth page transitions
- Consistent back navigation
- Floating action buttons for quick actions
- Material design patterns

## Data Source

The app uses mock data stored locally in `lib/data/mock_shops.dart`. Each shop includes:
- Name, description, and address
- Contact information (phone)
- Operating hours
- Ratings and features
- GPS coordinates for mapping
- High-quality images from Unsplash

## Future Enhancements

- [ ] User reviews and comments
- [ ] Favorites functionality
- [ ] Current location integration
- [ ] Push notifications for deals
- [ ] Social sharing features
- [ ] Backend integration with real data
- [ ] User accounts and profiles

## License

This project is open source and available under the [MIT License](LICENSE). 
