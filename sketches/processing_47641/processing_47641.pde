
/*
Playing around with user inputs, methods, loops, etc
Totally Pointless programme! :)
Haha
*/

import javax.swing.JOptionPane;

//Declare initial variables
String s = "homework";
boolean heavy = true;

//Declare input variable
int work;

void setup(){
  size(500,500);
  background(255);
  
  //Request User Input
  String s1 = JOptionPane.showInputDialog("How much homework do you have?");
  work = Integer.parseInt(s1);
  
  //Text Set up
  textFont(createFont("GillSansMT",30));
  textAlign(CENTER);
  fill(0);
  
  //No homework
  if (work == 0)
    text("Hooray! No "+s+"!!!",width/2,height/2);
  //Have homework
  else {
    checkWorkload(work);
    if (heavy == true)
      text("Still have "+work+" "+s+" :'[ ",width/2,height/2);
    else
      text("Only "+work+" "+s+" ;-] ",width/2,height/2);
  } 
}

void draw(){
}

