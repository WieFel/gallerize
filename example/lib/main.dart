import 'package:example/my_fancy_widget.dart';
import 'package:flutter/material.dart';
import 'package:gallerize/gallerize.dart';
import 'package:gallerize/themes/gallerize_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Fancy Widget Gallery',
      theme: GallerizeThemeData.darkThemeData,
      home: const GallerizePage(
          name: "My Fancy Widget",
          description:
              "This is a gallery app demoing the fancy widget that I created. "
              "With the help of the fancy widget, you can create the "
              "fanciest app you have ever seen!",
          codeFile: "lib/my_fancy_widget.dart",
          preview: MyFancyWidget()),
    );
  }
}
