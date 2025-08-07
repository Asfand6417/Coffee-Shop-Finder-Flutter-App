# Assets Folder

This folder is intended for static assets like images, fonts, and other files.

Currently, the app uses online images from Unsplash. You can add local images here and reference them in the pubspec.yaml file if needed.

## Adding Local Images

1. Place image files in this directory
2. Update `pubspec.yaml` to include the assets:
   ```yaml
   flutter:
     assets:
       - assets/images/
   ```
3. Reference in code:
   ```dart
   Image.asset('assets/images/your_image.png')
   ```