
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

//public class StudentAssistantApp extends JFrame {
//    private JTextField usernameField;
//    private JPasswordField passwordField;
//    private JButton loginButton;
//
//    public StudentAssistantApp() {
//        super("Student Assistant App");
//        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//
//        // Create login page components
//        JPanel loginPanel = new JPanel(new GridBagLayout());
//        GridBagConstraints constraints = new GridBagConstraints();
//        constraints.insets = new Insets(10, 10, 10, 10);
//
//        JLabel usernameLabel = new JLabel("Username:");
//        constraints.gridx = 0;
//        constraints.gridy = 0;
//        loginPanel.add(usernameLabel, constraints);
//
//        usernameField = new JTextField(20);
//        constraints.gridx = 1;
//        constraints.gridy = 0;
//        loginPanel.add(usernameField, constraints);
//
//        JLabel passwordLabel = new JLabel("Password:");
//        constraints.gridx = 0;
//        constraints.gridy = 1;
//        loginPanel.add(passwordLabel, constraints);
//
//        passwordField = new JPasswordField(20);
//        constraints.gridx = 1;
//        constraints.gridy = 1;
//        loginPanel.add(passwordField, constraints);
//
//        loginButton = new JButton("Login");
//        loginButton.addActionListener(new ActionListener() {
//            @Override
//            public void actionPerformed(ActionEvent e) {
//                // Add logic to validate login credentials
//                // If credentials are correct, open the home page
//                openHomePage();
//            }
//        });
//        constraints.gridx = 1;
//        constraints.gridy = 2;
//        loginPanel.add(loginButton, constraints);
//
//        // Set up the frame
//        add(loginPanel);
//        pack();
//        setLocationRelativeTo(null);
//        setVisible(true);
//    }

import javax.swing.*;
import java.awt.*;

//public class StudentAssistantApp extends JFrame {
//    private JTextField usernameField;
//    private JPasswordField passwordField;
//    private JButton loginButton;
//
//    public StudentAssistantApp() {
//        super("Login");
//        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//        setLayout(new BorderLayout());
//
//        // Create panel for login components
//        JPanel jPanel1 = new JPanel() {
//            // Override paintComponent method to make the panel transparent
//            @Override
//            protected void paintComponent(Graphics g) {
//                super.paintComponent(g);
//                // Draw a transparent background
//                g.setColor(new Color(0, 0, 0, 80));
//                g.fillRect(0, 0, getWidth(), getHeight());
//            }
//        };
//        jPanel1.setLayout(new GridBagLayout());
//
//        GridBagConstraints gbc = new GridBagConstraints();
//        gbc.gridx = 0;
//        gbc.gridy = 0;
//        gbc.insets = new Insets(5, 10, 5, 10); // Add padding
//
//        JLabel jLabel2 = new JLabel("Login");
//        jLabel2.setFont(new Font("Harrington", Font.BOLD, 24)); // Set font
//        jLabel2.setForeground(Color.WHITE); // Set text color
//        jPanel1.add(jLabel2, gbc);
//
//        gbc.gridy++;
//        JLabel jLabel3 = new JLabel("Username");
//        jLabel3.setFont(new Font("Microsoft Sans Serif", Font.BOLD, 14)); // Set font
//        jLabel3.setForeground(Color.WHITE); // Set text color
//        jPanel1.add(jLabel3, gbc);
//
//        gbc.gridy++;
//        usernameField = new JTextField(20);
//        usernameField.setFont(new Font("SansSerif", Font.BOLD, 12)); // Set font
//        jPanel1.add(usernameField, gbc);
//
//        gbc.gridy++;
//        JLabel jLabel4 = new JLabel("Password");
//        jLabel4.setFont(new Font("Microsoft Sans Serif", Font.BOLD, 14)); // Set font
//        jLabel4.setForeground(Color.WHITE); // Set text color
//        jPanel1.add(jLabel4, gbc);
//
//        gbc.gridy++;
//        passwordField = new JPasswordField(20);
//        passwordField.setFont(new Font("SansSerif", Font.BOLD, 12)); // Set font
//        jPanel1.add(passwordField, gbc);
//
//        gbc.gridy++;
//        loginButton = new JButton("LOGIN");
//        loginButton.setFont(new Font("Microsoft Sans Serif", Font.BOLD, 18)); // Set font
//        loginButton.setBackground(new Color(78, 114, 200)); // Set background color
//        loginButton.setForeground(Color.WHITE); // Set text color
//        jPanel1.add(loginButton, gbc);
//        loginButton.addActionListener(new ActionListener() {
//            @Override
//            public void actionPerformed(ActionEvent e) {
//                // Add logic to validate login credentials
//                // If credentials are correct, open the home page
//                openHomePage();
//            }
//        });
//
//        getContentPane().add(jPanel1, BorderLayout.CENTER);
//
//        JLabel jLabel1 = new JLabel();
//        jLabel1.setIcon(new ImageIcon("C:\\Users\\Bhavya\\Pictures\\Saved Pictures\\login_back.jpg"));
//        getContentPane().add(jLabel1, BorderLayout.WEST);
//
//        setSize(500, 300); // Set frame size
//        setLocationRelativeTo(null); // Center the frame on screen
//        setVisible(true);
//    }
//
//    private void openHomePage() {
//        // Create the home page frame and components
//        JFrame homePageFrame = new JFrame("Home Page");
//        JPanel homePanel = new JPanel();
//
//        // Add stylish buttons for each feature
//        JButton moneyTrackerButton = new JButton("Expense Tracker");
//        moneyTrackerButton.setFont(new Font("Times New Roman", Font.BOLD, 16));
//        moneyTrackerButton.setForeground(Color.WHITE);
//        moneyTrackerButton.setBackground(new Color(50, 150, 250)); // Blue background
//        moneyTrackerButton.setFocusPainted(false); // Remove focus border
//        moneyTrackerButton.setBorder(BorderFactory.createEmptyBorder(20, 30, 20, 30)); // Add padding
//        moneyTrackerButton.setCursor(new Cursor(Cursor.HAND_CURSOR));
//
//        JButton toDoListButton = new JButton("To-Do List");
//        toDoListButton.setFont(new Font("Times New Roman", Font.BOLD, 16));
//        toDoListButton.setForeground(Color.WHITE);
//        toDoListButton.setBackground(new Color(50, 150, 250)); // Blue background
//        toDoListButton.setFocusPainted(false); // Remove focus border
//        toDoListButton.setBorder(BorderFactory.createEmptyBorder(20, 30, 20, 30)); // Add padding
//        toDoListButton.setCursor(new Cursor(Cursor.HAND_CURSOR));
//
//        JButton languageTranslationButton = new JButton("Language Translation");
//        languageTranslationButton.setFont(new Font("Times New Roman", Font.BOLD, 16));
//        languageTranslationButton.setForeground(Color.WHITE);
//        languageTranslationButton.setBackground(new Color(50, 150, 250)); // Blue background
//        languageTranslationButton.setFocusPainted(false); // Remove focus border
//        languageTranslationButton.setBorder(BorderFactory.createEmptyBorder(20, 30, 20, 30)); // Add padding
//        languageTranslationButton.setCursor(new Cursor(Cursor.HAND_CURSOR));
//
//        JButton documentsDirectoryButton = new JButton("Documents Directory");
//        documentsDirectoryButton.setFont(new Font("Times New Roman", Font.BOLD, 16));
//        documentsDirectoryButton.setForeground(Color.WHITE);
//        documentsDirectoryButton.setBackground(new Color(50, 150, 250)); // Blue background
//        documentsDirectoryButton.setFocusPainted(false); // Remove focus border
//        documentsDirectoryButton.setBorder(BorderFactory.createEmptyBorder(20, 30, 20, 30)); // Add padding
//        documentsDirectoryButton.setCursor(new Cursor(Cursor.HAND_CURSOR));
//
//        // Add action listeners to the buttons to navigate to respective pages
//        moneyTrackerButton.addActionListener(e -> {
//            // Implement logic to open money tracker page
//        });
//
//        toDoListButton.addActionListener(e -> {
//            // Implement logic to open to-do list page
//        });
//
//        languageTranslationButton.addActionListener(e -> {
//            // Implement logic to open language translation page
//        });
//
//        documentsDirectoryButton.addActionListener(e -> {
//            // Implement logic to open documents directory page
//        });
//
//        // Add buttons to the home panel
//        homePanel.add(moneyTrackerButton);
//        homePanel.add(toDoListButton);
//        homePanel.add(languageTranslationButton);
//        homePanel.add(documentsDirectoryButton);
//
//        // Set up the home page frame
//        homePageFrame.add(homePanel);
//        homePageFrame.setSize(600, 450);
//        homePageFrame.setLocationRelativeTo(null);
//        homePageFrame.setVisible(true);
//    }
//
//    public static void main(String[] args) {
//        SwingUtilities.invokeLater(StudentAssistantApp::new);
//    }
//}


import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import java.io.File;
import java.io.IOException;

public class StudentAssistantApp extends JFrame {
    private JTextField usernameField;
    private JPasswordField passwordField;
    private JButton loginButton;

    public StudentAssistantApp() {
        super("Login");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new BorderLayout());

        // Load the background image
        BufferedImage backgroundImage = loadImage("C:\\Users\\Bhavya\\zenned_out\\ZennedOutIntellij\\ZennedOut\\login_back_alt.jpg");
        if (backgroundImage != null) {
            // Create a JLabel with the background image
            JLabel backgroundLabel = new JLabel(new ImageIcon(backgroundImage));
            // Set the layout of the content pane to BorderLayout
            getContentPane().setLayout(new BorderLayout());
            // Add the background label to the content pane
            getContentPane().add(backgroundLabel, BorderLayout.CENTER);
            // Set the size of the frame to match the size of the background image
            setSize(backgroundImage.getWidth(), backgroundImage.getHeight());
        }

        // Create panel for login components
        JPanel jPanel1 = new JPanel() {
            // Override paintComponent method to make the panel transparent
            @Override
            protected void paintComponent(Graphics g) {
                super.paintComponent(g);
                // Draw a transparent background
                g.setColor(new Color(0, 0, 0, 80));
                g.fillRect(0, 0, getWidth(), getHeight());
            }
        };
        jPanel1.setLayout(new GridBagLayout());

        GridBagConstraints gbc = new GridBagConstraints();
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.insets = new Insets(5, 10, 5, 10); // Add padding

        JLabel jLabel2 = new JLabel("Login");
        jLabel2.setFont(new Font("Harrington", Font.BOLD, 24)); // Set font
        jLabel2.setForeground(Color.WHITE); // Set text color
        jPanel1.add(jLabel2, gbc);

        gbc.gridy++;
        JLabel jLabel3 = new JLabel("Username");
        jLabel3.setFont(new Font("Microsoft Sans Serif", Font.BOLD, 14)); // Set font
        jLabel3.setForeground(Color.WHITE); // Set text color
        jPanel1.add(jLabel3, gbc);

        gbc.gridy++;
        usernameField = new JTextField(20);
        usernameField.setFont(new Font("SansSerif", Font.BOLD, 12)); // Set font
        jPanel1.add(usernameField, gbc);

        gbc.gridy++;
        JLabel jLabel4 = new JLabel("Password");
        jLabel4.setFont(new Font("Microsoft Sans Serif", Font.BOLD, 14)); // Set font
        jLabel4.setForeground(Color.WHITE); // Set text color
        jPanel1.add(jLabel4, gbc);

        gbc.gridy++;
        passwordField = new JPasswordField(20);
        passwordField.setFont(new Font("SansSerif", Font.BOLD, 12)); // Set font
        jPanel1.add(passwordField, gbc);

        gbc.gridy++;
        loginButton = new JButton("LOGIN");
        loginButton.setFont(new Font("Microsoft Sans Serif", Font.BOLD, 18)); // Set font
        loginButton.setBackground(new Color(78, 114, 200)); // Set background color
        loginButton.setForeground(Color.WHITE); // Set text color
        jPanel1.add(loginButton, gbc);
        loginButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                // Add logic to validate login credentials
                // If credentials are correct, open the home page
                openHomePage();
            }
        });

        // Add the login panel to the content pane
        getContentPane().add(jPanel1, BorderLayout.CENTER);

        // Set the frame to be visible
        setVisible(true);
    }

    // Load image method
    private BufferedImage loadImage(String imagePath) {
        try {
            // Load the image
            BufferedImage image = ImageIO.read(new File(imagePath));
            // Resize the image to fit the frame
            int width = image.getWidth();
            int height = image.getHeight();
            double aspectRatio = (double) width / height;
            // Set the desired width (you can adjust this value as needed)
            int desiredWidth = 800;
            // Calculate the new height based on the aspect ratio
            int desiredHeight = (int) (desiredWidth / aspectRatio);
            // Create a new resized image
            BufferedImage resizedImage = new BufferedImage(desiredWidth, desiredHeight, BufferedImage.TYPE_INT_ARGB);
            Graphics2D g2d = resizedImage.createGraphics();
            g2d.drawImage(image, 0, 0, desiredWidth, desiredHeight, null);
            g2d.dispose();
            return resizedImage;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    private void openHomePage() {
        // Create the home page frame and components
        JFrame homePageFrame = new JFrame("Home Page");
        JPanel homePanel = new JPanel();

        // Add stylish buttons for each feature
        JButton moneyTrackerButton = new JButton("Expense Tracker");
        moneyTrackerButton.setFont(new Font("Times New Roman", Font.BOLD, 16));
        moneyTrackerButton.setForeground(Color.WHITE);
        moneyTrackerButton.setBackground(new Color(50, 150, 250)); // Blue background
        moneyTrackerButton.setFocusPainted(false); // Remove focus border
        moneyTrackerButton.setBorder(BorderFactory.createEmptyBorder(20, 30, 20, 30)); // Add padding
        moneyTrackerButton.setCursor(new Cursor(Cursor.HAND_CURSOR));

        JButton toDoListButton = new JButton("To-Do List");
        toDoListButton.setFont(new Font("Times New Roman", Font.BOLD, 16));
        toDoListButton.setForeground(Color.WHITE);
        toDoListButton.setBackground(new Color(50, 150, 250)); // Blue background
        toDoListButton.setFocusPainted(false); // Remove focus border
        toDoListButton.setBorder(BorderFactory.createEmptyBorder(20, 30, 20, 30)); // Add padding
        toDoListButton.setCursor(new Cursor(Cursor.HAND_CURSOR));

        JButton languageTranslationButton = new JButton("Language Translation");
        languageTranslationButton.setFont(new Font("Times New Roman", Font.BOLD, 16));
        languageTranslationButton.setForeground(Color.WHITE);
        languageTranslationButton.setBackground(new Color(50, 150, 250)); // Blue background
        languageTranslationButton.setFocusPainted(false); // Remove focus border
        languageTranslationButton.setBorder(BorderFactory.createEmptyBorder(20, 30, 20, 30)); // Add padding
        languageTranslationButton.setCursor(new Cursor(Cursor.HAND_CURSOR));

        JButton documentsDirectoryButton = new JButton("Documents Directory");
        documentsDirectoryButton.setFont(new Font("Times New Roman", Font.BOLD, 16));
        documentsDirectoryButton.setForeground(Color.WHITE);
        documentsDirectoryButton.setBackground(new Color(50, 150, 250)); // Blue background
        documentsDirectoryButton.setFocusPainted(false); // Remove focus border
        documentsDirectoryButton.setBorder(BorderFactory.createEmptyBorder(20, 30, 20, 30)); // Add padding
        documentsDirectoryButton.setCursor(new Cursor(Cursor.HAND_CURSOR));

        // Add action listeners to the buttons to navigate to respective pages
        moneyTrackerButton.addActionListener(e -> {
            // Implement logic to open money tracker page
        });

        toDoListButton.addActionListener(e -> {
            // Implement logic to open to-do list page
        });

        languageTranslationButton.addActionListener(e -> {
            // Implement logic to open language translation page
        });

        documentsDirectoryButton.addActionListener(e -> {
            // Implement logic to open documents directory page
        });

        // Add buttons to the home panel
        homePanel.add(moneyTrackerButton);
        homePanel.add(toDoListButton);
        homePanel.add(languageTranslationButton);
        homePanel.add(documentsDirectoryButton);

        // Set up the home page frame
        homePageFrame.add(homePanel);
        homePageFrame.setSize(600, 450);
        homePageFrame.setLocationRelativeTo(null);
        homePageFrame.setVisible(true);
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(StudentAssistantApp::new);
    }
}


