
boolean init=true;
public void setup() { size(200,200,P3D); if(init){sf();init=false;}}
public void draw() {if(imgs){imgs=false;imgload();}if(t!=null)image(t,0,0,width,height);else text("please load an image",20,20,150,150);}

PImage t;
boolean imgs=false;  void imgload(){String imgName = selectInput();if(imgName!=null){t=requestImage(imgName); }t.resize(width,height);background(0);}







import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JToolBar;
import java.awt.Scrollbar;
import javax.swing.JProgressBar;
import javax.swing.JSlider;
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeEvent;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JRadioButton;
import javax.swing.JToggleButton;
import java.awt.GridBagLayout;
import java.awt.GridBagConstraints;
import java.awt.Insets;
//import com.jgoodies.forms.layout.FormLayout;
//import com.jgoodies.forms.layout.ColumnSpec;
//import com.jgoodies.forms.factories.FormFactory;
//import com.jgoodies.forms.layout.RowSpec;
import javax.swing.SpringLayout;
import javax.swing.DefaultComboBoxModel;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.event.ChangeListener;
import javax.swing.event.ChangeEvent;
import javax.swing.JTextField;
import java.awt.Component;
import javax.swing.Box;
import javax.swing.JLabel;
import javax.swing.JLayeredPane;
import javax.swing.JDesktopPane;
import javax.swing.JOptionPane;
import javax.swing.JTabbedPane;
import javax.swing.border.MatteBorder;
import java.awt.Color;
//import processing.core;
import processing.core.PApplet;

import javax.swing.*;
import java.awt.event.*;
import java.awt.Dimension;
import java.awt.Dialog.ModalExclusionType;

@SuppressWarnings("deprecation")

public void exit () {  int exitQuestion = JOptionPane.showConfirmDialog ( null, "Are you sure you want to exit now?\n" +  "Unsaved changes will be lost!",  "Done already?", JOptionPane.OK_CANCEL_OPTION ); if ( exitQuestion == JOptionPane.YES_OPTION ) System.exit ( 0 ); else return;}
 
 boolean play=false;
swframe sf;
int sval, scrval;
String st = "sval";


public void sf(){ sf = new swframe();}

public class swframe extends JFrame {	
  
  
  private JTextField textField;	private JPanel contentPane;
//	public static void main(String[] args) {EventQueue.invokeLater(new Runnable() {		public void run() {	try {	swframe frame = new swframe();		frame.setVisible(true);	} catch (Exception e) {	e.printStackTrace();}			}		});}

public swframe() {setVisible(true);
		addWindowListener ( new WindowAdapter() {public void windowClosing ( WindowEvent e ) {exit();}});
		setModalExclusionType(ModalExclusionType.APPLICATION_EXCLUDE);
		setForeground(Color.BLACK);
		setBackground(UIManager.getColor("inactiveCaption"));
	setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
	setBounds(100, 100, 450, 482);
	
	JMenuBar menuBar = new JMenuBar();
	menuBar.setForeground(Color.BLACK);
	menuBar.setBackground(UIManager.getColor("inactiveCaption"));
	setJMenuBar(menuBar);
	
	JMenu fileMenu = new JMenu("File");
	fileMenu.setForeground(Color.BLACK);
	fileMenu.setBackground(UIManager.getColor("inactiveCaption"));
	menuBar.add(fileMenu);
	
	JMenuItem mntmNew = new JMenuItem("New");
	fileMenu.add(mntmNew);
	
	JMenuItem mntmOpen = new JMenuItem("Open");
	fileMenu.add(mntmOpen);
		mntmOpen.addActionListener(new ActionListener() {
		public void actionPerformed(ActionEvent e) {imgs=true;
		}
	});

	JMenuItem mntmSave = new JMenuItem("Save");
	fileMenu.add(mntmSave);
	
	final JMenuItem mntmExit = new JMenuItem("Exit");
	mntmExit.addActionListener(new ActionListener() {
		public void actionPerformed(ActionEvent e) {exit();
		}
	});
	
	fileMenu.add(mntmExit);
	
	JMenu edtiMenu = new JMenu("Edit");
	edtiMenu.setForeground(Color.BLACK);
	edtiMenu.setBackground(UIManager.getColor("inactiveCaption"));
	menuBar.add(edtiMenu);
	
	JMenu mnCharacter = new JMenu("Window");
	mnCharacter.setForeground(Color.BLACK);
	mnCharacter.setBackground(UIManager.getColor("inactiveCaption"));
	menuBar.add(mnCharacter);
	
	JMenu mnM = new JMenu("View");
	mnM.setForeground(Color.BLACK);
	mnM.setBackground(UIManager.getColor("inactiveCaption"));
	menuBar.add(mnM);
	
	JMenu mnHelp = new JMenu("Help");
	mnHelp.setForeground(Color.BLACK);
	mnHelp.setBackground(UIManager.getColor("inactiveCaption"));
	menuBar.add(mnHelp);
	
	JMenuItem mntmInfo = new JMenuItem("Info");
	mntmInfo.addActionListener(new ActionListener() {
		public void actionPerformed(ActionEvent e) {JOptionPane.showMessageDialog(contentPane,"someText");		
		}
	});
	mnHelp.add(mntmInfo);
	contentPane = new JPanel();
	contentPane.setForeground(Color.BLACK);
	contentPane.setBackground(UIManager.getColor("inactiveCaption"));
	contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
	setContentPane(contentPane);
	
	JButton btnNewButton = new JButton("loadImage");	
	btnNewButton.setForeground(Color.BLACK);
	btnNewButton.setBackground(UIManager.getColor("inactiveCaption"));btnNewButton.addActionListener(new ActionListener() {		public void actionPerformed(ActionEvent e) {	imgs=true;		}	});
	
	JToolBar toolBar = new JToolBar();
	toolBar.setForeground(Color.BLACK);
	toolBar.setBackground(UIManager.getColor("inactiveCaption"));
	
	Component verticalStrut_3 = Box.createVerticalStrut(20);
	verticalStrut_3.setForeground(Color.BLACK);
	verticalStrut_3.setBackground(UIManager.getColor("inactiveCaption"));
	toolBar.add(verticalStrut_3);
	
	JToggleButton tglbtnNewToggleButton = new JToggleButton("a");
	tglbtnNewToggleButton.setForeground(Color.BLACK);
	tglbtnNewToggleButton.setBackground(UIManager.getColor("inactiveCaption"));
	toolBar.add(tglbtnNewToggleButton);


	final JSlider slider = new JSlider();
	slider.setForeground(Color.BLACK);
	slider.setBackground(UIManager.getColor("inactiveCaption"));
	slider.setToolTipText(st);
	final JProgressBar progressBar = new JProgressBar();
	progressBar.setForeground(Color.BLACK);
	progressBar.setBackground(UIManager.getColor("inactiveCaption"));progressBar.addChangeListener(new ChangeListener() { public void stateChanged(ChangeEvent arg0) {	}});
	 slider.addChangeListener(new ChangeListener() { public void stateChanged(ChangeEvent e) { sval = slider.getValue(); System.out.println("Neuer Wert: " + sval ); st = "sval"+sval; slider.setToolTipText(st); progressBar.setValue(sval); } });
	
	Component verticalStrut_2 = Box.createVerticalStrut(20);
	verticalStrut_2.setForeground(Color.BLACK);
	verticalStrut_2.setBackground(UIManager.getColor("inactiveCaption"));
	toolBar.add(verticalStrut_2);
	JToggleButton tglbtnB = new JToggleButton("b");
	tglbtnB.setForeground(Color.BLACK);
	tglbtnB.setBackground(UIManager.getColor("inactiveCaption"));
	toolBar.add(tglbtnB);
	progressBar.setStringPainted(true);
	
	JButton btnTest = new JButton("info");	
	btnTest.setForeground(Color.BLACK);
	btnTest.setBackground(UIManager.getColor("inactiveCaption"));btnTest.addActionListener(new ActionListener() {		public void actionPerformed(ActionEvent arg0) {  JOptionPane.showMessageDialog(contentPane,"someText");		}	});
	
	textField = new JTextField();
	textField.setForeground(Color.BLACK);
	textField.setBackground(UIManager.getColor("inactiveCaption"));
	textField.setColumns(10);
	
	JComboBox comboBox = new JComboBox();
	comboBox.setForeground(Color.BLACK);
	comboBox.setBackground(UIManager.getColor("inactiveCaption"));
	comboBox.setModel(new DefaultComboBoxModel(new String[] {"a", "b", "c", "d"}));
	
	Component verticalStrut_1 = Box.createVerticalStrut(20);
	verticalStrut_1.setForeground(Color.BLACK);
	verticalStrut_1.setBackground(UIManager.getColor("inactiveCaption"));
	toolBar.add(verticalStrut_1);
	
	JCheckBox chckbxNewCheckBox = new JCheckBox("check");
	chckbxNewCheckBox.setForeground(Color.BLACK);
	chckbxNewCheckBox.setBackground(UIManager.getColor("inactiveCaption"));
	toolBar.add(chckbxNewCheckBox);
	
	Component verticalStrut = Box.createVerticalStrut(20);
	verticalStrut.setForeground(Color.BLACK);
	verticalStrut.setBackground(UIManager.getColor("inactiveCaption"));
	toolBar.add(verticalStrut);
	
	JRadioButton rdbtnNewRadioButton = new JRadioButton("radio");
	rdbtnNewRadioButton.setForeground(Color.BLACK);
	rdbtnNewRadioButton.setBackground(UIManager.getColor("inactiveCaption"));
	toolBar.add(rdbtnNewRadioButton);
	
	Component verticalStrut_4 = Box.createVerticalStrut(20);
	verticalStrut_4.setForeground(Color.BLACK);
	verticalStrut_4.setBackground(UIManager.getColor("inactiveCaption"));
	toolBar.add(verticalStrut_4);
	
	JLabel lblNewLabel = new JLabel("controls");
	lblNewLabel.setForeground(Color.BLACK);
	lblNewLabel.setBackground(UIManager.getColor("inactiveCaption"));
	
	final JScrollBar scrollBar = new JScrollBar();
	scrollBar.setBackground(UIManager.getColor("inactiveCaption"));
	scrollBar.setForeground(Color.BLACK);
	scrollBar.setMaximum(10000);
	
	scrollBar.setOrientation(JScrollBar.HORIZONTAL);
	
	final JProgressBar progressBar_1 = new JProgressBar();
	progressBar_1.setForeground(Color.BLACK);
	progressBar_1.setBackground(UIManager.getColor("inactiveCaption"));
	progressBar_1.addChangeListener(new ChangeListener() {
		public void stateChanged(ChangeEvent arg0) {
		}
	});
	progressBar_1.setMaximum(10000);
	progressBar_1.setStringPainted(true);
	
	scrollBar.addAdjustmentListener(new AdjustmentListener() {
		public void adjustmentValueChanged(AdjustmentEvent arg0) {scrval=scrollBar.getValue();  progressBar_1.setValue(scrval);
		}
	});
	
	final JToggleButton tglbtnPlaystop = new JToggleButton("Play");
	tglbtnPlaystop.setForeground(Color.BLACK);
	tglbtnPlaystop.setBackground(UIManager.getColor("inactiveCaption"));
	tglbtnPlaystop.addChangeListener(new ChangeListener() {
		public void stateChanged(ChangeEvent arg0) {
	           // JToggleButton tglbtnPlaystop = (JToggleButton)e.getSource();
	            if (tglbtnPlaystop.isSelected()) {
	               System.out.println("button selected");
	               play=true;
	            } else {
	               System.out.println("button not selected");
	               play=false;

	         }

		    
		    
//			play=tglbtnPlaystop.getState();
		}
	});
	
	JEditorPane editorPane = new JEditorPane();
	editorPane.setForeground(Color.BLACK);
	editorPane.setBackground(UIManager.getColor("inactiveCaption"));
	
	JButton button = new JButton("test");
	button.setForeground(Color.BLACK);
	button.setBackground(UIManager.getColor("inactiveCaption"));
	
	
	GroupLayout gl_contentPane = new GroupLayout(contentPane);
	gl_contentPane.setHorizontalGroup(
		gl_contentPane.createParallelGroup(Alignment.LEADING)
			.addGroup(gl_contentPane.createSequentialGroup()
				.addGroup(gl_contentPane.createParallelGroup(Alignment.LEADING)
					.addComponent(slider, GroupLayout.PREFERRED_SIZE, 169, GroupLayout.PREFERRED_SIZE)
					.addComponent(progressBar, GroupLayout.PREFERRED_SIZE, 169, GroupLayout.PREFERRED_SIZE)
					.addComponent(comboBox, GroupLayout.PREFERRED_SIZE, 169, GroupLayout.PREFERRED_SIZE)
					.addComponent(textField, GroupLayout.PREFERRED_SIZE, 169, GroupLayout.PREFERRED_SIZE)
					.addComponent(lblNewLabel, GroupLayout.DEFAULT_SIZE, 235, Short.MAX_VALUE)
					.addGroup(gl_contentPane.createSequentialGroup()
						.addComponent(btnNewButton)
						.addGap(7)
						.addComponent(btnTest, GroupLayout.PREFERRED_SIZE, 69, GroupLayout.PREFERRED_SIZE)))
				.addPreferredGap(ComponentPlacement.RELATED)
				.addComponent(editorPane, GroupLayout.PREFERRED_SIZE, 116, GroupLayout.PREFERRED_SIZE)
				.addGap(76))
			.addGroup(gl_contentPane.createSequentialGroup()
				.addContainerGap(GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
				.addComponent(toolBar, GroupLayout.PREFERRED_SIZE, 408, GroupLayout.PREFERRED_SIZE)
				.addContainerGap())
			.addGroup(gl_contentPane.createSequentialGroup()
				.addContainerGap()
				.addComponent(progressBar_1, GroupLayout.DEFAULT_SIZE, 408, Short.MAX_VALUE)
				.addContainerGap())
			.addGroup(gl_contentPane.createSequentialGroup()
				.addGroup(gl_contentPane.createParallelGroup(Alignment.TRAILING, false)
					.addComponent(button, Alignment.LEADING, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
					.addComponent(tglbtnPlaystop, Alignment.LEADING, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
				.addContainerGap(293, Short.MAX_VALUE))
			.addGroup(gl_contentPane.createSequentialGroup()
				.addGap(12)
				.addComponent(scrollBar, GroupLayout.DEFAULT_SIZE, 408, Short.MAX_VALUE)
				.addContainerGap())
	);
	gl_contentPane.setVerticalGroup(
		gl_contentPane.createParallelGroup(Alignment.TRAILING)
			.addGroup(gl_contentPane.createSequentialGroup()
				.addComponent(progressBar_1, GroupLayout.PREFERRED_SIZE, 8, GroupLayout.PREFERRED_SIZE)
				.addPreferredGap(ComponentPlacement.RELATED)
				.addComponent(scrollBar, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
				.addPreferredGap(ComponentPlacement.RELATED)
				.addComponent(tglbtnPlaystop)
				.addPreferredGap(ComponentPlacement.RELATED)
				.addComponent(button)
				.addPreferredGap(ComponentPlacement.RELATED, 13, Short.MAX_VALUE)
				.addComponent(toolBar, GroupLayout.PREFERRED_SIZE, 30, GroupLayout.PREFERRED_SIZE)
				.addPreferredGap(ComponentPlacement.UNRELATED)
				.addComponent(lblNewLabel, GroupLayout.PREFERRED_SIZE, 22, GroupLayout.PREFERRED_SIZE)
				.addPreferredGap(ComponentPlacement.RELATED)
				.addGroup(gl_contentPane.createParallelGroup(Alignment.LEADING)
					.addComponent(btnNewButton, GroupLayout.PREFERRED_SIZE, 30, GroupLayout.PREFERRED_SIZE)
					.addComponent(btnTest, GroupLayout.PREFERRED_SIZE, 30, GroupLayout.PREFERRED_SIZE))
				.addGap(13)
				.addComponent(slider, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
				.addGap(7)
				.addGroup(gl_contentPane.createParallelGroup(Alignment.LEADING)
					.addGroup(gl_contentPane.createSequentialGroup()
						.addComponent(progressBar, GroupLayout.PREFERRED_SIZE, 37, GroupLayout.PREFERRED_SIZE)
						.addGap(7)
						.addComponent(comboBox, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
						.addGap(26)
						.addComponent(textField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
					.addComponent(editorPane, GroupLayout.PREFERRED_SIZE, 60, GroupLayout.PREFERRED_SIZE))
				.addContainerGap())
	);
	contentPane.setLayout(gl_contentPane);
}

}


