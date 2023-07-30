import 'package:flutter/material.dart';

/// Class for presenting information about a package/widget to the user.
class GallerizeInfo extends StatelessWidget {
  /// The title of the package/widget.
  final String title;

  /// The description of the package/widget.
  final String description;

  /// Creates an instance of [GallerizeInfo].
  const GallerizeInfo(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(16.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
