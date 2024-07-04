// // screens/notes_screen.dart

// import 'package:flutter/material.dart';

// class NotesScreen extends StatefulWidget {
//   @override
//   _NotesScreenState createState() => _NotesScreenState();
// }

// class _NotesScreenState extends State<NotesScreen> {
//   TextEditingController notesController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notes'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildNotesInputField(),
//             SizedBox(height: 16.0),
//             _buildSaveButton(),
//             SizedBox(height: 16.0),
//             Text(
//               'Your Notes',
//               style: TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 16.0),
//             _buildNotesPreview(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildNotesInputField() {
//     return TextField(
//       controller: notesController,
//       maxLines: 5,
//       decoration: InputDecoration(
//         labelText: 'Type your notes here',
//         border: OutlineInputBorder(),
//       ),
//     );
//   }

//   Widget _buildSaveButton() {
//     return ElevatedButton(
//       onPressed: () {
//         // Implement your save logic here
//         _saveNotes();
//       },
//       child: Text('Save Notes'),
//       style: ElevatedButton.styleFrom(
//         primary: Colors.blue,
//       ),
//     );
//   }

//   void _saveNotes() {
//     // Implement your save logic here
//     String notes = notesController.text;
//     // You can save the 'notes' variable to a database or perform any other action.
//     print('Notes saved: $notes');
//     // Optionally, you can show a confirmation message or navigate to a different screen.
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Notes saved successfully!'),
//         duration: Duration(seconds: 2),
//       ),
//     );
//   }

//   Widget _buildNotesPreview() {
//     return Text(
//       notesController.text,
//       style: TextStyle(
//         fontSize: 18.0,
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      home: NotesScreen(),
    );
  }
}

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  TextEditingController _documentNameController = TextEditingController();
  TextEditingController _documentContentController = TextEditingController();

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
              TextField(
                controller: _documentNameController,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  labelText: 'Document Name',
                  labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _documentContentController,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Document Content',
                  labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  enabledBorder: UnderlineInputBorder(
                   borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  await saveDocument();
                  _documentNameController.clear();
                  _documentContentController.clear();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text(
                  'Save Document',
                  style: TextStyle(color: Color(0xFFBEC1B9), fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveDocument() async {
    final String documentName = _documentNameController.text;
    final String documentContent = _documentContentController.text;

    if (documentName.isEmpty || documentContent.isEmpty) {
      // Ensure both fields are filled
      return;
    }

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$documentName.txt');

    await file.writeAsString(documentContent);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Document saved successfully!',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green, // Optional: Change the background color of the snackbar
      ),
    );

    print('Document saved at: ${file.path}');
  }
}
