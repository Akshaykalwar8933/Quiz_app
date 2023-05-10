import 'package:flutter/material.dart';
import 'package:highlight/languages/dart.dart';
import 'package:highlight/languages/python.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_highlight/themes/vs.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:flutter_highlight/themes/darcula.dart';
import 'package:code_text_field/code_text_field.dart';

class CodeEditor extends StatefulWidget {
  const CodeEditor({Key? key}) : super(key: key);

  @override
  _CodeEditorState createState() => _CodeEditorState();
}

class _CodeEditorState extends State<CodeEditor> {
  CodeController? _codeController;
  Map<String, TextStyle>? theme = monokaiSublimeTheme;
  @override
  Widget build(BuildContext context) {
    final source = "void main() {\n    print(\"Hello, world!\");\n}";

    // Instantiate the CodeController
    _codeController = CodeController(
      text: source,
      language: python,
      // theme: theme,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Code Editor"),
        backgroundColor: Colors.teal,
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: Colors.blueGrey,
              elevation: 20,
              icon: Icon(Icons.color_lens_outlined),
              iconEnabledColor: Colors.white,
              items: <String>['Atom', 'Monokai-sublime', 'VS', 'Darcula']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  onTap: () {
                    setState(() {
                      if (value == "Monokai-sublime") {
                        theme = monokaiSublimeTheme;
                      } else if (value == "Atom") {
                        theme = atomOneDarkTheme;
                      } else if (value == "VS") {
                        theme = vsTheme;
                      } else if (value == "Darcula") {
                        theme = darculaTheme;
                      }
                    });
                  },
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
              onChanged: (_) {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: CodeField(
            controller: _codeController!,
            textStyle: TextStyle(fontFamily: 'SourceCode', fontSize: 20),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          print("Code Running in terminal");
        },
        child: Icon(
          Icons.play_arrow_sharp,
        ),
      ),
    );
  }
}