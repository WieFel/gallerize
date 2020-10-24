import 'package:flutter/material.dart';
import 'package:gallerize/gallerize.dart';

/// Class for presenting the demo of a package/widget to the user. The user can
/// switch between info, preview and source code pages concerning the given demo.
class GallerizePage extends StatefulWidget {
  /// The name of the package/widget.
  String name;

  /// Description of the package/widget.
  String description;

  /// Path to the file containing the sample code.
  String codeFile;

  /// `Widget` representing a preview of the given package/widget to demonstrate.
  Widget preview;

  /// Creates an instance of [GallerizePage].
  GallerizePage(
      {Key key,
      @required this.name,
      @required this.description,
      this.codeFile,
      this.preview})
      : super(key: key);

  @override
  _GallerizePageState createState() => _GallerizePageState();
}

class _GallerizePageState extends State<GallerizePage> {
  Widget _current;

  @override
  void initState() {
    _current =
        GallerizeInfo(title: widget.name, description: widget.description);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var actions = [
      IconButton(
        icon: Icon(Icons.info),
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
    ];

    if (widget.preview != null)
      actions.add(IconButton(
        icon: Icon(Icons.visibility),
        color: _current is GallerizePreview ? null : Colors.white,
        onPressed: () {
          setState(() {
            _current = GallerizePreview(
              preview: widget.preview,
            );
          });
        },
      ));

    if (widget.codeFile != null)
      actions.add(IconButton(
        icon: Icon(Icons.code),
        color: _current is GallerizeCode ? null : Colors.white,
        onPressed: () {
          setState(() {
            _current = GallerizeCode(codeFile: widget.codeFile);
          });
        },
      ));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        actions: actions,
      ),
      body: _current,
    );
  }
}
