// import 'package:flutter/material.dart';

// class GradeTrackerScreen extends StatefulWidget {
//   @override
//   _GradeTrackerScreenState createState() => _GradeTrackerScreenState();
// }

// class _GradeTrackerScreenState extends State<GradeTrackerScreen> {
//   List<Map<String, dynamic>> courses = [];
//   TextEditingController courseController = TextEditingController();
//   TextEditingController gradeController = TextEditingController();
//   TextEditingController creditHoursController = TextEditingController();

//   // Grade points for different grades
//   Map<String, double> gradePoints = {
//     'A': 4.0,
//     'B': 3.0,
//     'C': 2.0,
//     'D': 1.0,
//     'F': 0.0,
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Grade Tracker'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               'Courses',
//               style: TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           _buildCourseInputField(),
//           Divider(thickness: 2.0, color: Colors.black), // Divider
//           _buildCourseList(),
//           _buildGpaDisplay(),
//         ],
//       ),
//     );
//   }

//   Widget _buildCourseInputField() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Text(
//             'Add Course',
//             style: TextStyle(
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         TextField(
//           controller: courseController,
//           decoration: InputDecoration(
//             labelText: 'Course Name',
//           ),
//         ),
//         TextField(
//           controller: gradeController,
//           decoration: InputDecoration(
//             labelText: 'Grade (e.g., A, B, C)',
//           ),
//         ),
//         TextField(
//           controller: creditHoursController,
//           decoration: InputDecoration(
//             labelText: 'Credit Hours',
//           ),
//           keyboardType: TextInputType.number,
//         ),
//         ElevatedButton(
//           onPressed: () {
//             _addCourse();
//           },
//           child: Text('Add Course'),
//         ),
//       ],
//     );
//   }

//   Widget _buildCourseList() {
//     return Expanded(
//       child: ListView.builder(
//         itemCount: courses.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text('${courses[index]['course']} - ${courses[index]['grade']}'),
//             subtitle: Text('Credit Hours: ${courses[index]['creditHours']}'),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildGpaDisplay() {
//     double gpa = _calculateGpa();
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Text(
//         'GPA: ${gpa.toStringAsFixed(2)}',
//         style: TextStyle(
//           fontSize: 20.0,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }

//   void _addCourse() {
//     if (courseController.text.isNotEmpty &&
//         gradeController.text.isNotEmpty &&
//         creditHoursController.text.isNotEmpty) {
//       setState(() {
//         courses.add({
//           'course': courseController.text,
//           'grade': gradeController.text,
//           'creditHours': int.parse(creditHoursController.text),
//         });
//         courseController.clear();
//         gradeController.clear();
//         creditHoursController.clear();
//       });
//     } else {
//       print("Course, Grade, or Credit Hours is empty!");
//     }
//   }

//   double _calculateGpa() {
//     double totalGradePoints = 0;
//     int totalCreditHours = 0;

//     for (var course in courses) {
//       double gradePoint = gradePoints[course['grade']] ?? 0.0;
//       totalGradePoints += gradePoint * course['creditHours'];
//       totalCreditHours += course['creditHours'];
//     }

//     if (totalCreditHours == 0) {
//       return 0.0;
//     }

//     return totalGradePoints / totalCreditHours;
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: GradeTrackerScreen(),
//   ));
// }

import 'package:flutter/material.dart';

class GradeTrackerScreen extends StatefulWidget {
  @override
  _GradeTrackerScreenState createState() => _GradeTrackerScreenState();
}

class _GradeTrackerScreenState extends State<GradeTrackerScreen> {
  List<Map<String, dynamic>> courses = [];
  TextEditingController courseController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController creditHoursController = TextEditingController();

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Courses',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Divider(thickness: 2.0, color: Colors.white),
            _buildCourseInputField(),
            Divider(thickness: 2.0, color: Colors.white), // Divider
            _buildCourseList(),
            _buildGpaDisplay(),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseInputField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Add Course',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        TextField(
          controller: courseController,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            labelText: 'Course Name',
            labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
        TextField(
          controller: gradeController,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            labelText: 'Grade (e.g., O, A+, B, C+)',
            labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
        TextField(
          controller: creditHoursController,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            labelText: 'Credits Earned',
            labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          keyboardType: TextInputType.number,
        ),
        ElevatedButton(
          onPressed: () {
            _addCourse();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: Text(
            'Add Course',
            style: TextStyle(color: Color(0xFFBEC1B9), fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildCourseList() {
    return Expanded(
      child: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              '${courses[index]['course']} - ${courses[index]['grade']}',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Credits Earned: ${courses[index]['creditHours']}',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGpaDisplay() {
    double gpa = _calculateGpa();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'GPA: ${gpa.toStringAsFixed(2)}',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  void _addCourse() {
    if (courseController.text.isNotEmpty &&
        gradeController.text.isNotEmpty &&
        creditHoursController.text.isNotEmpty) {
      setState(() {
        courses.add({
          'course': courseController.text,
          'grade': gradeController.text,
          'creditHours': int.parse(creditHoursController.text),
        });
        courseController.clear();
        gradeController.clear();
        creditHoursController.clear();
      });
    } else {
      print("Course, Grade, or Credit Hours is empty!");
    }
  }

  double _calculateGpa() {
    double totalGradeCreditProduct = 0.0;
    double totalCreditHours = 0.0;

    for (var course in courses) {
      double grade = _getGradeValue(course['grade']) ?? 0.0;
      totalGradeCreditProduct += grade * (course['creditHours'] as num).toDouble();
      totalCreditHours += (course['creditHours'] as num).toDouble();
    }

    if (totalCreditHours == 0.0) {
      return 0.0;
    }

    return totalGradeCreditProduct / totalCreditHours;
  }

  double? _getGradeValue(String grade) {
    switch (grade.toUpperCase()) {
      case 'O':
        return 10.0;
      case 'A+':
        return 9.0;
      case 'A':
        return 8.0;
      case 'B+':
        return 7.0;
      case 'B':
        return 6.0;
      case 'C+':
        return 5.0;            
      case 'C':
        return 4.0;
      case 'D':
        return 3.0;
      case 'F':
        return 0.0;
      default:
        return null;
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: GradeTrackerScreen(),
  ));
}

