# gallerize

[![pub.dev](https://img.shields.io/pub/v/gallerize?logo=dart)](https://pub.dev/packages/gallerize)

Flutter package for creating a gallery (demo) of your package/widget.

## ⚠ In development!

This project is still a work in progress, not yet ready for production.


## Purpose of this package

The **gallerize** package can be used to demonstrate what YOUR package/widget is for. It is inspired by [Flutter Gallery](https://gallery.flutter.dev/) ([see repo on GitHub](https://github.com/flutter/gallery)), therefore the name "gallerize".

**gallerize** allows you to take your own package/widget and create an app around it which provides a description, a preview and exemplary source code, just like [Flutter Gallery](https://gallery.flutter.dev/) does it for the material and cupertino widgets. **gallerize** saves you from creating boilerplate code for creating a gallery app structure, importing themes etc.

## Example

Suppose you created an awesome widget (`lib/my_fancy_widget.dart`) which you want to show to your friends/workmates:
```dart
class MyFancyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text("My Fancy Widget!"),
      ),
    );
  }
}
```

Using **gallerize** you can easily create an app that looks as follows:
// TODO add images


## How to use it?

1. Add dependency to `pubspec.yaml`:
```yaml
dependencies:
  gallerize: <current_version>
```
2. Add all the relevant source files to the `assets` of `pubspec.yaml`:
```yaml
  assets:
    - lib/my_fancy_widget.dart
```
3. Import the **gallerize** package:
```dart
import 'package:gallerize/gallerize.dart';
```
4. Use the `GallerizePage` widget within your app:
```dart
    MaterialApp(
      title: 'My Fancy Widget Gallery',
      theme: GallerizeThemeData.darkThemeData,
      home: GallerizePage(
          name: "My Fancy Widget",
          description:
              "This is a gallery app demoing the fancy widget that I created. "
              "With the help of the fancy widget, you can create the "
              "fanciest app you have ever seen!",
          codeFile: "lib/my_fancy_widget.dart",
          preview: MyFancyWidget()),
    )
```
`GallerizePage` expects at least a `name` and a `description`, which are shown in the info-tab. `codeFile` is used to tell **gallerize** which dart code to show in the code-tab. `preview` defines the widget that should be shown in the preview-tab.

### Setting the app theme

// TODO

### Changin the syntax highlighting theme

// TODO
