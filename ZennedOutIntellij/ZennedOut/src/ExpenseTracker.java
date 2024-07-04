import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;

public class ExpenseTracker extends JPanel {
    private List<Expense> expenses;
    private JTextField amountField;
    private JTextField titleField;
    private JLabel totalExpensesLabel;
    private JTextArea expenseListArea;

    public ExpenseTracker() {
        // Initialize list to store expenses
        expenses = new ArrayList<>();

        // Set layout
        setLayout(new BorderLayout());
        setBackground(Color.WHITE);

        // Panel to hold input fields and button
        JPanel inputPanel = new JPanel(new GridLayout(3, 2, 10, 10));
        inputPanel.setBorder(new EmptyBorder(20, 20, 20, 20));
        inputPanel.setBackground(Color.WHITE);

        JLabel amountLabel = new JLabel("Amount:");
        amountLabel.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 16));
        inputPanel.add(amountLabel);

        amountField = new JTextField(10);
        inputPanel.add(amountField);

        JLabel titleLabel = new JLabel("Title:");
        titleLabel.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 16));
        inputPanel.add(titleLabel);

        titleField = new JTextField(10);
        inputPanel.add(titleField);

        JPanel buttonPanel = new JPanel(new FlowLayout(FlowLayout.CENTER));
        buttonPanel.setBackground(Color.WHITE);

        JButton addButton = new JButton("Add Expense");
        addButton.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 16));
        addButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                addExpense();
            }
        });
        buttonPanel.add(addButton);
        inputPanel.add(buttonPanel);

        JLabel totalLabel = new JLabel("Total Expenses:");
        totalLabel.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 16));

        totalExpensesLabel = new JLabel("0");
        totalExpensesLabel.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 16));

        add(inputPanel, BorderLayout.NORTH);

        // Panel to display all expenses
        JPanel expensePanel = new JPanel(new BorderLayout());
        expensePanel.setBorder(new EmptyBorder(0, 20, 20, 20));
        expensePanel.setBackground(Color.WHITE);

        JLabel expenseListLabel = new JLabel("All Expenses:");
        expenseListLabel.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 16));
        expensePanel.add(expenseListLabel, BorderLayout.NORTH);

        expenseListArea = new JTextArea(10, 20);
        expenseListArea.setEditable(false);
        expenseListArea.setFont(new Font(Font.SANS_SERIF, Font.PLAIN, 14));
        JScrollPane scrollPane = new JScrollPane(expenseListArea);
        expensePanel.add(scrollPane, BorderLayout.CENTER);

        add(expensePanel, BorderLayout.CENTER);

        JPanel totalExpensesPanel = new JPanel(new BorderLayout());
        totalExpensesPanel.setBackground(Color.WHITE);
        totalExpensesPanel.setBorder(new EmptyBorder(10, 20, 20, 20));

        totalExpensesPanel.add(totalLabel, BorderLayout.WEST);
        totalExpensesPanel.add(totalExpensesLabel, BorderLayout.CENTER);

        add(totalExpensesPanel, BorderLayout.SOUTH);
    }

    private void addExpense() {
        try {
            double amount = Double.parseDouble(amountField.getText());
            String title = titleField.getText();
            Expense expense = new Expense(amount, title);
            expenses.add(expense);
            updateTotalExpenses();
            updateExpenseList();
            // Optionally, you can clear the input fields after adding an expense
            amountField.setText("");
            titleField.setText("");
        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(this, "Invalid amount. Please enter a valid number.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void updateTotalExpenses() {
        double total = 0;
        for (Expense expense : expenses) {
            total += expense.getAmount();
        }
        totalExpensesLabel.setText(String.valueOf(total));
    }

    private void updateExpenseList() {
        StringBuilder sb = new StringBuilder();
        for (Expense expense : expenses) {
            sb.append(expense.getTitle()).append(": ₹").append(expense.getAmount()).append("\n");
        }
        expenseListArea.setText(sb.toString());
    }

    private class Expense {
        private double amount;
        private String title;

        public Expense(double amount, String title) {
            this.amount = amount;
            this.title = title;
        }

        public double getAmount() {
            return amount;
        }

        public String getTitle() {
            return title;
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            JFrame frame = new JFrame("Expense Tracker");
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            frame.getContentPane().add(new ExpenseTracker());
            frame.pack();
            frame.setLocationRelativeTo(null);
            frame.setVisible(true);
        });
    }
}

