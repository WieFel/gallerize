import 'package:flutter/material.dart';
import 'package:flutter_highlighting/themes/dracula.dart';
import 'package:gallerize/gallerize.dart';

/// Class for presenting the demo of a package/widget to the user. The user can
/// switch between info, preview and source code pages concerning the given demo.
class GallerizePage extends StatefulWidget {
  /// The name of the package/widget.
  final String name;

  /// Description of the package/widget.
  final String description;

  /// Path to the file containing the sample code.
  final String? codeFile;

  /// `Widget` representing a preview of the given package/widget to demonstrate.
  final Widget? preview;

  /// The syntax highlighting theme.
  /// Refer to [HighlightView.theme].
  /// [All available themes](https://github.com/pd4d10/highlight/blob/master/flutter_highlight/lib/themes)
  ///
  /// Defaults to [draculaTheme].
  final Map<String, TextStyle> highlightingTheme;

  /// Creates an instance of [GallerizePage].
  const GallerizePage({
    super.key,
    required this.name,
    required this.description,
    this.codeFile,
    this.preview,
    this.highlightingTheme = draculaTheme,
  });

  @override
  GallerizePageState createState() => GallerizePageState();
}

class GallerizePageState extends State<GallerizePage> {
  Widget? _current;

  @override
  void initState() {
    _current =
        GallerizeInfo(title: widget.name, description: widget.description);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            color: _current is GallerizeInfo ? null : Colors.white,
            onPressed: () {
              setState(() {
                _current = GallerizeInfo(
                  title: widget.name,
                  description: widget.description,
                );
              });
            },
          ),
          if (widget.preview != null)
            IconButton(
              icon: const Icon(Icons.visibility),
              color: _current is GallerizePreview ? null : Colors.white,
              onPressed: () {
                setState(() {
                  _current = GallerizePreview(
                    preview: widget.preview!,
                  );
                });
              },
            ),
          if (widget.codeFile != null)
            IconButton(
              icon: const Icon(Icons.code),
              color: _current is GallerizeCode ? null : Colors.white,
              onPressed: () {
                setState(() {
                  _current = GallerizeCode(
                    codeFile: widget.codeFile!,
                    highlightingTheme: widget.highlightingTheme,
                  );
                });
              },
            ),
        ],
      ),
      body: _current,
    );
  }
}
