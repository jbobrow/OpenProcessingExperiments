
import processing.pdf.*;
import java.util.Calendar;
Boolean savePDF = false;


//add your variables here
int i = 0; 
int slope=0;


//end variables section

void setup()
{
     // set the background color
    background(#4C0489);
    
    // canvas size (Integers only, please.)
    size(300, 300); 
      
    // smooth edges
    smooth();
    
    // limit the number of frames per second
    frameRate(30);
    
    // set the width of the line. 
    strokeWeight(4);

}

void draw()
{
   // this line will start pdf export, if the variable savePDF was set to true 
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");
 

   //add your code  here

    // set the color
    stroke(random(50), random(255), random(255), 100);
    
    // draw the line
    //line(i, 0, random(0, width), height);
    //line(-slope +i, 0, i, height);
    line(-slope +i, 0, i, height);
 
   
    
    // move over a pixel
    if (i < width) {
        i=i+10;
    } else {
        i = 0; 
    }
   //end your code here


    // end of pdf recording
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
  
}

void mouseDragged()
{
// code that happens when the mouse moves
// with the button down
}

void mousePressed()
{
// code that happens when the mouse button
// is pressed
}

void mouseReleased()
{
// code that happens when the mouse button
// is released
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
