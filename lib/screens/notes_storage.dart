import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Upload and Storage',
      home: FileUploadScreen(),
    );
  }
}

class FileUploadScreen extends StatefulWidget {
  @override
  _FileUploadScreenState createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  List<File> _uploadedFiles = [];

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      setState(() {
        _uploadedFiles = result.paths.map((path) => File(path!)).toList();
      });
    }
  }

  Future<void> _saveFiles() async {
    final directory = await getApplicationDocumentsDirectory();

    for (File file in _uploadedFiles) {
      final String fileName = file.uri.pathSegments.last;
      final String filePath = '${directory.path}/$fileName';

      await file.copy(filePath);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Files saved successfully!'),
      ),
    );
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: _pickFiles,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text(
                  'Pick Files',
                  style: TextStyle(color: Color(0xFFBEC1B9)),
                ),
              ),
              SizedBox(height: 16.0),
              if (_uploadedFiles.isNotEmpty)
                ElevatedButton(
                onPressed: _saveFiles,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text(
                  'Save Files',
                  style: TextStyle(color: Color(0xFFBEC1B9)),
                ),
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  itemCount: _uploadedFiles.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        _uploadedFiles[index].uri.pathSegments.last,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
