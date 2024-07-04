// import 'package:flutter/material.dart';
// import 'screens/home_screen.dart';
// import 'screens/expense_screen.dart';
// import 'screens/todo_screen.dart';
// import 'screens/notes_screen.dart';
// import 'screens/grade_tracker_screen.dart';
// import 'screens/notes_storage.dart';
// import 'screens/translator.dart';
// import 'screens/chatbot.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ZennedOut',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _currentIndex = 0;

//   List<Widget> _tabs = [
//     HomePage(),
//     ExpenseScreen(),
//     ToDoScreen(),
//     NotesScreen(),
//     GradeTrackerScreen(),
//     FileUploadScreen(),
//     TranslationScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: null,
//       body: _tabs[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.attach_money),
//             label: 'Expense',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.check),
//             label: 'To-Do',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.note),
//             label: 'Notes',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.calculate),
//             label: 'GPA',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.description),
//             label: 'Documents',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.translate),
//             label: 'Translate',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.chat),
//             label: 'Chatbot', 
//           ),
//         ],
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//             if (index == _tabs.length - 1) {
//             // Navigate to the ChatbotScreen if the Chatbot button is tapped
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => MyInAppWebView(),
//                 ),
//               );
//             }
//           });
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/expense_screen.dart';
import 'screens/todo_screen.dart';
import 'screens/notes_screen.dart';
import 'screens/grade_tracker_screen.dart';
import 'screens/notes_storage.dart';
import 'screens/translator.dart';
import 'screens/chatbot.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZennedOut',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List<Widget> _tabs = [
    HomePage(),
    ExpenseScreen(),
    ToDoScreen(),
    NotesScreen(),
    GradeTrackerScreen(),
    FileUploadScreen(),
    TranslationScreen(),
    MyWebView(url: 'https://mediafiles.botpress.cloud/5d72f9df-62c6-48cb-aa73-c4d0e67c98a2/webchat/bot.html'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: IndexedStack(
        index: _currentIndex,
        children: _tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Expense',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'To-Do',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'GPA',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Documents',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.translate),
            label: 'Translate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'ChatBot', 
          ),
        ],
        onTap: (index) {
          // print('Tapped index: $index');
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
