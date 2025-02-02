package todoclasses;

import javax.swing.*;
import java.awt.*;
import javax.swing.border.Border;

public class ButtonPanel extends JPanel{

    private JButton addTask;
    private JButton clear;

    Border emptyBorder = BorderFactory.createEmptyBorder();

    ButtonPanel(){
        this.setPreferredSize(new Dimension(400, 60));

        addTask = new JButton("Add Task");
        addTask.setBorder(getBorder());
        addTask.setFont(new Font("Sans-serif", Font.PLAIN, 20));
        this.add(addTask);

        this.add(Box.createHorizontalStrut(20));

        clear = new JButton("Clear Completed Tasks");
        clear.setBorder(emptyBorder);
        clear.setFont(new Font("Sans-serif", Font.PLAIN, 20));
        this.add(clear);
    }

    public JButton getNewTask(){
        return addTask;
    }

    public JButton getClear(){
        return clear;
    }

}
