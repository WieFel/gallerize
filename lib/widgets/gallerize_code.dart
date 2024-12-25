import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlighting/flutter_highlighting.dart';
import 'package:flutter_highlighting/themes/dracula.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highlighting/languages/dart.dart';

/// Class for presenting the source code of a given package/widget.
class GallerizeCode extends StatefulWidget {
  /// The path to the file to be read, relative to the root of the project.
  /// E.g. the path could be: lib/main.dart
  final String codeFile;

  /// The syntax highlighting theme.
  /// Refer to [HighlightView.theme].
  /// [All available themes](https://github.com/pd4d10/highlight/blob/master/flutter_highlight/lib/themes)
  ///
  /// Defaults to [draculaTheme].
  final Map<String, TextStyle> highlightingTheme;

  /// Creates an instance of [GallerizeCode].
  const GallerizeCode({
    super.key,
    required this.codeFile,
    this.highlightingTheme = draculaTheme,
  });

  @override
  GallerizeCodeState createState() => GallerizeCodeState();
}

class GallerizeCodeState extends State<GallerizeCode> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context).loadString(widget.codeFile),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return SizedBox.expand(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          // copy code
                          Clipboard.setData(
                              ClipboardData(text: snapshot.data!));

                          // show snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Copied to clipboard!")));
                        },
                        child: Text("Copy all".toUpperCase()),
                      ),
                    ],
                  ),
                  HighlightView(
                    snapshot.data!,
                    languageId: dart.id,
                    theme: widget.highlightingTheme,
                    padding: const EdgeInsets.all(8.0),
                    textStyle: GoogleFonts.firaCode(),
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
