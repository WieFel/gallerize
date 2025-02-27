import 'package:flutter/material.dart';

/// Class for showing a preview of the given package/widget as an actual widget.
class GallerizePreview extends StatelessWidget {
  /// The preview widget that is shown within the preview area.
  final Widget preview;

  /// Creates an instance of [GallerizePreview].
  const GallerizePreview({
    super.key,
    required this.preview,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
        child: preview,
      ),
    );
  }
}
