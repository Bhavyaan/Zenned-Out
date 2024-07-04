//import javax.swing.*;
//import javax.swing.border.EmptyBorder;
//import java.awt.*;
//import java.awt.event.ActionEvent;
//import java.awt.event.ActionListener;
//import java.text.DateFormat;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//
//public class ToDoList extends JPanel {
//    private List<Task> tasks;
//    private JTextField taskField;
//    private JSpinner timeSpinner;
//    private JLabel tasksLeftLabel;
//    private JPanel taskListPanel;
//
//    public ToDoList() {
//        // Initialize list to store tasks
//        tasks = new ArrayList<>();
//
//        // Set layout
//        setLayout(new BorderLayout());
//        setBackground(Color.WHITE);
//
//        // Panel to hold input fields and button
//        JPanel inputPanel = new JPanel(new GridLayout(3, 2, 10, 10));
//        inputPanel.setBorder(new EmptyBorder(20, 20, 20, 20));
//        inputPanel.setBackground(Color.WHITE);
//
//        JLabel taskLabel = new JLabel("Task:");
//        taskLabel.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 16));
//        inputPanel.add(taskLabel);
//
//        taskField = new JTextField(15);
//        inputPanel.add(taskField);
//
//        JLabel dueTimeLabel = new JLabel("Due Time:");
//        dueTimeLabel.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 16));
//        inputPanel.add(dueTimeLabel);
//
//        timeSpinner = new JSpinner(new SpinnerDateModel());
//        JSpinner.DateEditor timeEditor = new JSpinner.DateEditor(timeSpinner, "HH:mm");
//        timeSpinner.setEditor(timeEditor);
//        inputPanel.add(timeSpinner);
//
//        JButton addButton = new JButton("Add Task");
//        addButton.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 16));
//        addButton.addActionListener(e -> addTask());
//        inputPanel.add(addButton);
//
//        add(inputPanel, BorderLayout.NORTH);
//
//        // Panel to display task list
//        taskListPanel = new JPanel();
//        taskListPanel.setLayout(new BoxLayout(taskListPanel, BoxLayout.Y_AXIS));
//        taskListPanel.setBackground(Color.WHITE);
//        JScrollPane scrollPane = new JScrollPane(taskListPanel);
//        scrollPane.setBorder(BorderFactory.createEmptyBorder());
//        add(scrollPane, BorderLayout.CENTER);
//
//        // Panel to display tasks left
//        JPanel tasksLeftPanel = new JPanel(new BorderLayout());
//        tasksLeftPanel.setBackground(Color.WHITE);
//        tasksLeftPanel.setBorder(new EmptyBorder(10, 20, 20, 20));
//
//        JLabel tasksLeftTitleLabel = new JLabel("Tasks Left Today: ");
//        tasksLeftTitleLabel.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 16));
//        tasksLeftPanel.add(tasksLeftTitleLabel, BorderLayout.WEST);
//
//        tasksLeftLabel = new JLabel("0");
//        tasksLeftLabel.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 16));
//        tasksLeftPanel.add(tasksLeftLabel, BorderLayout.CENTER);
//
//        add(tasksLeftPanel, BorderLayout.SOUTH);
//    }
//
//    private void addTask() {
//        String taskDescription = taskField.getText();
//        Date dueTime = (Date) timeSpinner.getValue();
//        Task task = new Task(taskDescription, dueTime);
//        tasks.add(task);
//        updateTaskList();
//        updateTasksLeft();
//        // Optionally, you can clear the input fields after adding a task
//        taskField.setText("");
//    }
//
//    private void updateTaskList() {
//        taskListPanel.removeAll();
//        for (Task task : tasks) {
//            JPanel taskPanel = new JPanel(new BorderLayout());
//            taskPanel.setBackground(Color.WHITE);
//            taskPanel.setBorder(BorderFactory.createLineBorder(Color.LIGHT_GRAY));
//
//            JCheckBox checkBox = new JCheckBox();
//            checkBox.setBackground(Color.WHITE);
//            checkBox.addActionListener(new ActionListener() {
//                @Override
//                public void actionPerformed(ActionEvent e) {
//                    task.toggleCompleted();
//                    updateTasksLeft();
//                }
//            });
//            taskPanel.add(checkBox, BorderLayout.WEST);
//
//            JLabel taskLabel = new JLabel(task.getDescription() + " (Due: " + formatTime(task.getDueTime()) + ")");
//            taskLabel.setFont(new Font(Font.SANS_SERIF, Font.PLAIN, 14));
//            taskPanel.add(taskLabel, BorderLayout.CENTER);
//
//            taskListPanel.add(taskPanel);
//            taskListPanel.add(Box.createRigidArea(new Dimension(0, 5))); // Add spacing between tasks
//        }
//        taskListPanel.revalidate();
//        taskListPanel.repaint();
//    }
//
//    private void updateTasksLeft() {
//        int tasksLeft = 0;
//        for (Task task : tasks) {
//            if (!task.isCompleted()) {
//                tasksLeft++;
//            }
//        }
//        tasksLeftLabel.setText(String.valueOf(tasksLeft));
//    }
//
//    private String formatTime(Date date) {
//        DateFormat dateFormat = new SimpleDateFormat("HH:mm");
//        return dateFormat.format(date);
//    }
//
//    private static class Task {
//        private String description;
//        private Date dueTime;
//        private boolean completed;
//
//        public Task(String description, Date dueTime) {
//            this.description = description;
//            this.dueTime = dueTime;
//            this.completed = false;
//        }
//
//        public String getDescription() {
//            return description;
//        }
//
//        public Date getDueTime() {
//            return dueTime;
//        }
//
//        public boolean isCompleted() {
//            return completed;
//        }
//
//        public void toggleCompleted() {
//            completed = !completed;
//        }
//    }
//
//    public static void main(String[] args) {
//        SwingUtilities.invokeLater(() -> {
//            JFrame frame = new JFrame("To-Do List");
//            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//            frame.getContentPane().add(new ToDoList());
//            frame.pack();
//            frame.setLocationRelativeTo(null);
//            frame.setVisible(true);
//        });
//    }
//}

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ToDoList extends JFrame {
    private List<Task> tasks;
    private JTextField taskField;
    private JTextField dueTimeField;
    private JLabel tasksLeftLabel;
    private JPanel taskListPanel;

    public ToDoList() {
        setTitle("To-Do List");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(400, 500);
        setLocationRelativeTo(null);

        // Initialize list to store tasks
        tasks = new ArrayList<>();

        // Set layout
        setLayout(new BorderLayout());
        getContentPane().setBackground(new Color(0xFF9EC9E2)); // Set background color

        // Panel to hold input fields and button
        JPanel inputPanel = new JPanel(new GridLayout(4, 1));
        inputPanel.setBorder(new EmptyBorder(20, 20, 20, 20));
        inputPanel.setBackground(new Color(0xFF9EC9E2)); // Set background color

        JLabel taskLabel = new JLabel("Add Task:");
        taskLabel.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 16));
        taskLabel.setForeground(Color.WHITE); // Set text color to white
        inputPanel.add(taskLabel);

        taskField = new JTextField();
        inputPanel.add(taskField);

        JLabel dueTimeLabel = new JLabel("Due Time (HH:mm):");
        dueTimeLabel.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 16));
        dueTimeLabel.setForeground(Color.WHITE); // Set text color to white
        inputPanel.add(dueTimeLabel);

        dueTimeField = new JTextField();
        inputPanel.add(dueTimeField);

        JButton addButton = new JButton("Add Task");
        addButton.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 16));
        addButton.setBackground(Color.WHITE);
        addButton.addActionListener(e -> addTask());
        inputPanel.add(addButton);

        add(inputPanel, BorderLayout.NORTH);

        // Panel to display task list
        taskListPanel = new JPanel();
        taskListPanel.setLayout(new BoxLayout(taskListPanel, BoxLayout.Y_AXIS));
        taskListPanel.setBackground(new Color(0xFF9EC9E2)); // Set background color
        JScrollPane scrollPane = new JScrollPane(taskListPanel);
        scrollPane.setBorder(BorderFactory.createEmptyBorder());
        add(scrollPane, BorderLayout.CENTER);

        // Panel to display tasks left
        JPanel tasksLeftPanel = new JPanel(new BorderLayout());
        tasksLeftPanel.setBackground(new Color(0xFF9EC9E2)); // Set background color
        tasksLeftPanel.setBorder(new EmptyBorder(10, 20, 20, 20));

        JLabel tasksLeftTitleLabel = new JLabel("Tasks Left Today: ");
        tasksLeftTitleLabel.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 16));
        tasksLeftTitleLabel.setForeground(Color.WHITE); // Set text color to white
        tasksLeftPanel.add(tasksLeftTitleLabel, BorderLayout.WEST);

        tasksLeftLabel = new JLabel("0");
        tasksLeftLabel.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 16));
        tasksLeftLabel.setForeground(Color.WHITE); // Set text color to white
        tasksLeftPanel.add(tasksLeftLabel, BorderLayout.CENTER);

        add(tasksLeftPanel, BorderLayout.SOUTH);
    }

    private void addTask() {
        String taskDescription = taskField.getText();
        String dueTimeString = dueTimeField.getText();
        DateFormat dateFormat = new SimpleDateFormat("HH:mm");
        try {
            Date dueTime = dateFormat.parse(dueTimeString);
            Task task = new Task(taskDescription, dueTime);
            tasks.add(task);
            updateTaskList();
            updateTasksLeft();
            // Optionally, you can clear the input fields after adding a task
            taskField.setText("");
            dueTimeField.setText("");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(this, "Invalid due time format. Please enter time in HH:mm format.");
        }
    }

    private void updateTaskList() {
        taskListPanel.removeAll();
        for (Task task : tasks) {
            JPanel taskPanel = new JPanel(new BorderLayout());
            taskPanel.setBackground(Color.WHITE);
            taskPanel.setBorder(BorderFactory.createLineBorder(Color.LIGHT_GRAY));

            JCheckBox checkBox = new JCheckBox();
            checkBox.setBackground(Color.WHITE);
            checkBox.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    task.toggleCompleted();
                    updateTasksLeft();
                }
            });
            taskPanel.add(checkBox, BorderLayout.WEST);

            JLabel taskLabel = new JLabel(task.getDescription() + " (Due: " + task.getDueTimeAsString() + ")");
            taskLabel.setFont(new Font(Font.SANS_SERIF, Font.PLAIN, 14));
            taskPanel.add(taskLabel, BorderLayout.CENTER);

            taskListPanel.add(taskPanel);
            taskListPanel.add(Box.createRigidArea(new Dimension(0, 5))); // Add spacing between tasks
        }
        taskListPanel.revalidate();
        taskListPanel.repaint();
    }

    private void updateTasksLeft() {
        int tasksLeft = 0;
        for (Task task : tasks) {
            if (!task.isCompleted()) {
                tasksLeft++;
            }
        }
        tasksLeftLabel.setText(String.valueOf(tasksLeft));
    }

    private static class Task {
        private String description;
        private Date dueTime;
        private boolean completed;

        public Task(String description, Date dueTime) {
            this.description = description;
            this.dueTime = dueTime;
            this.completed = false;
        }

        public String getDescription() {
            return description;
        }

        public Date getDueTime() {
            return dueTime;
        }

        public String getDueTimeAsString() {
            DateFormat dateFormat = new SimpleDateFormat("HH:mm");
            return dateFormat.format(dueTime);
        }

        public boolean isCompleted() {
            return completed;
        }

        public void toggleCompleted() {
            completed = !completed;
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            new ToDoList().setVisible(true);
        });
    }
}
