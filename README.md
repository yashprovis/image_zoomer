# Image Zoomer plugin
<?code-excerpt path-base="excerpts/packages/image_zoomer_example"?>

[![pub package](https://img.shields.io/pub/v/image_zoomer.svg)](https://pub.dev/packages/image_zoomer)

A new Flutter package for a customized Image Zoom in/out Dialog.

|             | Android | iOS  | Linux | macOS  | Web | Windows     |
|-------------|---------|------|-------|--------|-----|-------------|
| **Support** | SDK 16+ | 9.0+ | Any   | 10.11+ | Any | Any         |

## Usage
To use this plugin, add `image_zoomer` as a [dependency in your pubspec.yaml file](https://pub.dev/packages/image_zoomer/example).

### Examples
Here are small examples that show you how to use the Dialog.

#### Write data
<?code-excerpt "readme_excerpts.dart (Write)"?>
```dart
// Create a dialog to show the Image Zoomer Dialog
showDialog(
        context: context,
        builder: (_) => const ImageZoomer(
              image:
                  "https://i.pinimg.com/550x/ae/de/a9/aedea9ea9db181dcbc0ad146c87d8842.jpg",
              imageType: ImageType.network,
            ));
```
