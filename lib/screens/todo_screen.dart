
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ToDoScreen extends StatefulWidget {
  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  List<Map<String, dynamic>> tasks = [];
  TextEditingController taskController = TextEditingController();
  TextEditingController dueTimeController = TextEditingController();

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
                'Tasks (${_getIncompleteTasksCount()} left)',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set text color to white
                ),
              ),
            ),
            Divider(thickness: 2.0, color: Colors.white), // Divider with white color
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Tasks for the Day',
                style: TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set text color to white
                ),
              ),
            ),
            _buildTaskList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Color(0xFFBEC1B9)),
      ),
    );
  }

  Widget _buildTaskInputField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Add Task',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextField(
          controller: taskController,
          decoration: InputDecoration(
            labelText: 'Task',
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: dueTimeController,
                decoration: InputDecoration(
                  labelText: 'Due Time (HH:mm)',
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.access_time),
              onPressed: () => _pickTime(context),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            _addTask();
          },
          child: Text('Add Task'),
        ),
      ],
    );
  }

  Widget _buildTaskList() {
    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          DateTime dueTime = tasks[index]['dueTime'];
          bool isOverdue = dueTime.isBefore(DateTime.now());

          return Dismissible(
            key: Key(tasks[index]['task']),
            onDismissed: (direction) {
              _removeTask(index);
            },
            background: Container(
              color: Colors.red,
              child: Icon(Icons.delete, color: Colors.white),
            ),
            child: ListTile(
              title: Text(
                tasks[index]['task'],
                style: TextStyle(
                  decoration: tasks[index]['completed']
                      ? TextDecoration.lineThrough
                      : null,
                  color: isOverdue ? Colors.red : null,
                ),
              ),
              subtitle: Text(
                'Due Time: ${DateFormat.Hm().format(dueTime)}',
                style: TextStyle(
                  color: isOverdue ? Colors.red : null,
                ),
              ),

              leading: Checkbox(
                value: tasks[index]['completed'],
                onChanged: (value) {
                  _toggleTaskCompletion(index, value);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _pickTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        dueTimeController.text =
            '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
      });
    }
  }

  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Task'),
          content: _buildTaskInputField(),
        );
      },
    );
  }

  void _addTask() {
  if (taskController.text.isNotEmpty && dueTimeController.text.isNotEmpty) {
    DateTime dueTime = DateTime.now().add(Duration(
      hours: int.parse(dueTimeController.text.split(':')[0]),
      minutes: int.parse(dueTimeController.text.split(':')[1]),
    ));

    setState(() {
      tasks.add({
        'task': taskController.text,
        'dueTime': dueTime,
        'completed': false,
      });
      taskController.clear();
      dueTimeController.clear();
    });
    Navigator.pop(context);
  } else {
    print("Task or Due Time is empty!");
  }
}

  void _removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void _toggleTaskCompletion(int index, bool? value) {
    setState(() {
      tasks[index]['completed'] = value ?? false;
    });
  }

  int _getIncompleteTasksCount() {
    return tasks.where((task) => !task['completed']).length;
  }
}

void main() {
  runApp(MaterialApp(
    home: ToDoScreen(),
  ));
}

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class ToDoScreen extends StatefulWidget {
//   @override
//   _ToDoScreenState createState() => _ToDoScreenState();
// }

// class _ToDoScreenState extends State<ToDoScreen> {
//   List<Map<String, dynamic>> tasks = [];
//   TextEditingController taskController = TextEditingController();
//   TextEditingController dueTimeController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('To-Do List'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               'Tasks (${_getIncompleteTasksCount()} left)',
//               style: TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           _buildTaskInputField(),
//           Divider(thickness: 2.0, color: Colors.black), // Divider
//           _buildTaskList(),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _showAddTaskDialog(context);
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }

//   Widget _buildTaskInputField() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Text(
//             'Add Task',
//             style: TextStyle(
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         TextField(
//           controller: taskController,
//           decoration: InputDecoration(
//             labelText: 'Task',
//           ),
//         ),
//         Row(
//           children: [
//             Expanded(
//               child: TextField(
//                 controller: dueTimeController,
//                 decoration: InputDecoration(
//                   labelText: 'Due Time (HH:mm)',
//                 ),
//               ),
//             ),
//             IconButton(
//               icon: Icon(Icons.access_time),
//               onPressed: () => _pickTime(context),
//             ),
//           ],
//         ),
//         ElevatedButton(
//           onPressed: () {
//             _addTask();
//           },
//           child: Text('Add Task'),
//         ),
//       ],
//     );
//   }

//   Widget _buildTaskList() {
//   return Expanded(
//     child: ListView.builder(
//       itemCount: tasks.length,
//       itemBuilder: (context, index) {
//         DateTime dueTime = tasks[index]['dueTime'];
//         bool isOverdue = dueTime.isBefore(DateTime.now());

//         return Dismissible(
//           key: Key(tasks[index]['task']),
//           onDismissed: (direction) {
//             _removeTask(index);
//           },
//           background: Container(
//             color: Colors.red,
//             child: Icon(Icons.delete, color: Colors.white),
//           ),
//           child: ListTile(
//             title: Text(
//               tasks[index]['task'],
//               style: TextStyle(
//                 decoration: tasks[index]['completed']
//                     ? TextDecoration.lineThrough
//                     : null,
//                 color: isOverdue ? Colors.red : null,
//               ),
//             ),
//             subtitle: Text(
//               'Due Time: ${DateFormat.Hm().format(tasks[index]['dueTime'])}',
//               style: TextStyle(
//                 color: isOverdue ? Colors.red : null,
//               ),
//             ),

//             leading: Checkbox(
//               value: tasks[index]['completed'],
//               onChanged: (value) {
//                 _toggleTaskCompletion(index, value);
//               },
//             ),
//           ),
//         );
//       },
//     ),
//   );
// }

//   Future<void> _pickTime(BuildContext context) async {
//     TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );

//     if (picked != null) {
//       setState(() {
//         dueTimeController.text =
//             '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
//       });
//     }
//   }

//   void _showAddTaskDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Add New Task'),
//           content: _buildTaskInputField(),
//         );
//       },
//     );
//   }

//   void _addTask() {
//   if (taskController.text.isNotEmpty && dueTimeController.text.isNotEmpty) {
//     DateTime dueTime = DateTime.now().add(Duration(
//       hours: int.parse(dueTimeController.text.split(':')[0]),
//       minutes: int.parse(dueTimeController.text.split(':')[1]),
//     ));

//     setState(() {
//       tasks.add({
//         'task': taskController.text,
//         'dueTime': dueTime, // Store the due time as DateTime
//         'completed': false,
//       });
//       taskController.clear();
//       dueTimeController.clear();
//     });
//     Navigator.pop(context);
//   } else {
//     print("Task or Due Time is empty!");
//   }
// }

//   void _removeTask(int index) {
//     setState(() {
//       tasks.removeAt(index);
//     });
//   }

//   void _toggleTaskCompletion(int index, bool? value) {
//     setState(() {
//       tasks[index]['completed'] = value ?? false;
//     });
//   }

//   int _getIncompleteTasksCount() {
//     return tasks.where((task) => !task['completed']).length;
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: ToDoScreen(),
//   ));
// }
