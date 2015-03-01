
import processing.pdf.*;
import java.util.Calendar;

boolean savePDF = false;

void setup(){
  size(400,400);
  background(247,247,2);  
  

}


void draw() {
  
   // this line will start pdf export, if the variable savePDF was set to true 
   if (savePDF) beginRecord(PDF, timestamp()+".pdf");

   //start your code here
     //background(255);
    noStroke();
    fill(247,2,191,40);
    rectMode(CENTER);
    rect(mouseX, mouseY, 40, 40 );
    println(mouseX);
    

   //end your code here


  // end of pdf recording
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
  


}



//don't change this

void keyPressed() {
  
  //key s or p for saving and printing
  if (key=='s' || key=='S') saveFrame(timestamp()+"_##.png");
  if (key=='p' || key=='P') savePDF = true;

}

//creates a timeStamp String
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


