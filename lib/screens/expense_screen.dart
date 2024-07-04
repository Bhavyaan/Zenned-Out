import 'package:flutter/material.dart';

class ExpenseScreen extends StatefulWidget {
  @override
  _ExpenseScreenState createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  List<Map<String, dynamic>> expenses = [];
  double totalExpenses = 0.0;

  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();

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
                'Recent Expenses',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Divider(thickness: 2.0, color: Colors.white),
            _buildExpenseList(),
            Divider(thickness: 2.0, color: Colors.white),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total Expenses: ₹${totalExpenses.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddExpenseDialog(context);
        },
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Color(0xFFBEC1B9)),
      ),
    );
  }

  Widget _buildExpenseList() {
  return Expanded(
    child: ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(expenses[index]['title']),
          subtitle: Text('₹${expenses[index]['amount'].toStringAsFixed(2)}'),
        );
      },
    ),
  );
}

  void _showAddExpenseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Expense'),
          content: _buildExpenseInputField(),
        );
      },
    );
  }

  Widget _buildExpenseInputField() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      TextField(
        controller: titleController,
        decoration: InputDecoration(
          labelText: 'Expense Title',
        ),
      ),
      SizedBox(height: 16.0),
      TextField(
        controller: amountController,  // Make sure amountController is assigned here
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Amount (₹)',
        ),
      ),
      SizedBox(height: 16.0),
      ElevatedButton(
        onPressed: () {
          _addExpense();
        },
        child: Text('Add Expense'),
      ),
    ],
  );
}


  void _addExpense() {
  if (titleController.text.isNotEmpty && amountController.text.isNotEmpty) {
    setState(() {
      double amount = double.parse(amountController.text);
      expenses.add({
        'title': titleController.text,
        'amount': amount,
      });

      totalExpenses += amount;

      titleController.clear();
      amountController.clear();
    });
    Navigator.pop(context);
  } else {
    print("Title or amount is empty!");
  }
}


}
