# gallerize

[![gallerize](https://img.shields.io/badge/gallerize-check%20demo-purple?logo=flutter&logoColor=blue)](https://wiefel.github.io/gallerize/#/)
[![pub.dev](https://img.shields.io/pub/v/gallerize?logo=dart)](https://pub.dev/packages/gallerize)
[![analysis](https://github.com/WieFel/gallerize/workflows/analysis/badge.svg)](https://github.com/WieFel/gallerize/actions?query=workflow%3Aanalysis)

Flutter package for creating [Flutter Gallery](https://gallery.flutter.dev)-like gallery/demo for your package/widget.


## Purpose of this package

The **gallerize** package can be used to demonstrate what YOUR package/widget is for. It is inspired by [Flutter Gallery](https://gallery.flutter.dev/) ([see repo on GitHub](https://github.com/flutter/gallery)), therefore the name "gallerize".

**gallerize** allows you to take your own package/widget and create an app around it which provides a description, a preview and exemplary source code, just like [Flutter Gallery](https://gallery.flutter.dev/) does it for the material and cupertino widgets. **gallerize** saves you from creating boilerplate code for creating a gallery app structure, importing themes etc.

## Example

Suppose you created an awesome widget (`lib/my_fancy_widget.dart`) which you want to show to your workmates/boss or to your package's users:
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

Using **gallerize** you can easily create an app that looks as follows:<br/>
<img src="https://github.com/WieFel/gallerize/raw/master/.github/images/info.png"  height="500" alt="Info tab of example app"> 
<img src="https://github.com/WieFel/gallerize/raw/master/.github/images/preview.png"  height="500" alt="Preview tab of example app"> 
<img src="https://github.com/WieFel/gallerize/raw/master/.github/images/code.png"  height="500" alt="Code tab of example app">

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

## Setting the app theme

To change the theme for your gallery-app, you can use two themes offered by **gallerize**, which were taken from [Flutter Gallery](https://gallery.flutter.dev/):
```dart
MaterialApp(
  theme: GallerizeThemeData.darkThemeData,
)
```
The two offered themes are `GallerizeThemeData.darkThemeData` and `GallerizeThemeData.lightThemeData`.

## Changing the syntax highlighting theme

**gallerize** internally uses [flutter_highlight](https://pub.dev/packages/flutter_highlight) for syntax highlighting. See [all available themes](https://github.com/pd4d10/highlight/blob/master/flutter_highlight/lib/themes).

To use a certain syntax highlighting theme, do the following:
1. Import the desired theme (e.g. `a11y-dark.dart`):
```dart
import 'package:flutter_highlight/themes/a11y-dark.dart';
```
2. Set the theme in your `GallerizePage`:
```dart
GallerizePage(
    highlightingTheme: a11yDarkTheme
    ...
)
```
The default theme used is `draculaTheme` (`'package:flutter_highlight/themes/dracula.dart'`)

## gallerize badge [![gallerize](https://img.shields.io/badge/gallerize-check%20demo-purple?logo=flutter&logoColor=blue)](https://wiefel.github.io/gallerize/#/)

There is a **gallerize** badge that you can put on your project's `README.md`.

Add this to your `README.md`:
```markdown
[![gallerize](https://img.shields.io/badge/gallerize-check%20demo-purple?logo=flutter&logoColor=blue)](<URL_TO_YOUR_GALLERY_PAGE>)
```
For customizing the badge, see https://shields.io/

## TODO
- Multi-screen size support (toggle for fullscreen/mobile view)

## Contribute
Check out the [Purpose of gallerize package](https://github.com/WieFel/gallerize/issues/1#issuecomment-709350953) before you begin with any contibution.

1. You'll need a GitHub account.
2. Fork the [gallerize repository](https://github.com/WieFel/gallerize).
3. Pick an issue to work on from the [issue list](https://github.com/WieFel/gallerize/issues).
4. Implement it.
5. Add your name and email in `authors` section in `pubspec.yaml` file. (as soon as `pubspec.yaml` is set up for it...)
6. Create a pull request.
7. Star this project. ⭐
8. Become a hero!! 🎉
