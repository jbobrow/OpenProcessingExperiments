
//this is the template to create screenshots.
//press 's' to create a .png file in the same folder
//'press 'p' to create a .pdf file in the same folder
//ensure that you only add code in the draw() method between the lines. 
//add your code  here
//end your code here

import processing.pdf.*;
import java.util.Calendar;
Boolean savePDF = false;


//add your variables here
int i = 0; 

//end variables section

void setup()
{
     // set the background color
    background(255);
    
    // canvas size (Integers only, please.)
    size(1000, 1000); 
      
    // smooth edges
    smooth();
    
    // limit the number of frames per second
    frameRate(500);
    
    // set the width of the line. 
    strokeWeight(1);

}

void draw()
{
   // this line will start pdf export, if the variable savePDF was set to true 
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");
 

   //add your code  here

    // set the color
    stroke(random(50), random(255), random(255), 100);
    
    // draw the line
    line(i, 0, random(0, width), height);
    
    // move over a pixel
    if (i < width) {
        i++;
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


