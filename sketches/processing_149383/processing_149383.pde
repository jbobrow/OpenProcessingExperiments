
PFont font;
int[] data;
import javax.swing.*; 
int input1,input2,input3,input4;

void setup(){
  try { 
    UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
  } 
  catch (Exception e) { 
    e.printStackTrace();
  } 
  String preset="2";
  String op1s = JOptionPane.showInputDialog(frame, "Enter number 1", preset);
  if(op1s != null) input1=Integer.parseInt(op1s);
  String op2s = JOptionPane.showInputDialog(frame, "Enter number 2", preset);
  if(op2s != null) input2=Integer.parseInt(op1s);
  String op3s = JOptionPane.showInputDialog(frame, "Enter number 3", preset);
  if(op2s != null) input3=Integer.parseInt(op1s);
  String op4s = JOptionPane.showInputDialog(frame, "Enter number 4", preset);
  if(op2s != null) input4=Integer.parseInt(op1s);
  size(600,600);
  
  int seed = input1+input2+input3+input4;
  int second = seed * input1 + input2;
  String[] writeseed = split(str(seed), ' ');;
  saveStrings("data.txt", writeseed);
  

  
  String[] thedata = loadStrings("data.txt");
  data = int(split(thedata[0],','));
}

void draw(){

   background(255);
   stroke(0);
   for ( int i = 0; i <data.length; i++)
   {
   fill(data[i]);
   rect(i*40,150,20,data[i]);
   rect(i*40,150,20,data[i]);
   rect(i*40,250,20,data[i]);
   rect(i*40,350,20,data[i]);
   rect(i*40,450,20,data[i]);
   rect(i*40,550,20,data[i]);

   }
    
  }


