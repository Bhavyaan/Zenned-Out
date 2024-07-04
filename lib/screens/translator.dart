// import 'package:flutter/material.dart';
// import 'package:translator/translator.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Translation Screen',
//       home: TranslationScreen(),
//     );
//   }
// }

// class TranslationScreen extends StatefulWidget {
//   @override
//   _TranslationScreenState createState() => _TranslationScreenState();
// }

// class _TranslationScreenState extends State<TranslationScreen> {
//   TextEditingController _textController = TextEditingController();
//   String _translatedText = '';

//   void _translateText() {
//     if (_textController.text.isEmpty) {
//       return;
//     }

//     final translator = GoogleTranslator();

//     translator.translate(_textController.text, from: 'en', to: 'es').then((result) {
//       setState(() {
//         _translatedText = result.text;
//       });
//     }).catchError((error) {
//       print('Translation error: $error');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Translation Screen'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _textController,
//               decoration: InputDecoration(labelText: 'Enter text to translate'),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _translateText,
//               child: Text('Translate'),
//             ),
//             SizedBox(height: 16.0),
//             Text('Translated Text:'),
//             SizedBox(height: 8.0),
//             Text(
//               _translatedText,
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Translation Screen',
      home: TranslationScreen(),
    );
  }
}

class TranslationScreen extends StatefulWidget {
  @override
  _TranslationScreenState createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  TextEditingController _textController = TextEditingController();
  String _translatedText = '';
  String _selectedSourceLanguage = 'en';
  String _selectedTargetLanguage = 'es';

  void _translateText() {
    if (_textController.text.isEmpty) {
      return;
    }

    final translator = GoogleTranslator();

    translator
        .translate(_textController.text, from: _selectedSourceLanguage, to: _selectedTargetLanguage)
        .then((result) {
      setState(() {
        _translatedText = result.text;
      });
    }).catchError((error) {
      print('Translation error: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF9EC9E2), // Light blue
              Color(0xFFFFB668), // Light orange
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Source Language:',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8.0),
                  DropdownButton<String>(
                    value: _selectedSourceLanguage,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedSourceLanguage = newValue!;
                      });
                    },
                    items: <String>['en', 'es', 'fr', 'de', 'ja', 'ko', 'zh']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Text(
                    'Target Language:',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8.0),
                  DropdownButton<String>(
                    value: _selectedTargetLanguage,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedTargetLanguage = newValue!;
                      });
                    },
                    items: <String>['en', 'es', 'fr', 'de', 'ja', 'ko', 'zh']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Divider(color: Colors.white),
              Text(
                'Options: en - English; es - Spanish; fr - French; de - German; ja - Japanese; ko - Korean; zh - Chinese',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Divider(color: Colors.white),
              SizedBox(height: 16.0),
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Enter text to translate',
                  labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _translateText,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text('Translate', style: TextStyle(color: Color(0xFFBEC1B9), fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 16.0),
              Text(
                'Translated Text:',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  _translatedText,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
