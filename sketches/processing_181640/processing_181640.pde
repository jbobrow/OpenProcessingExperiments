
//this is the template to create screenshots.
//press 's' to create a .png file in the same folder
//'press 'p' to create a .pdf file in the same folder
//ensure that you only add code in the draw() method between the lines. 
//add your code  here
//end your code here

import processing.pdf.*;
import java.util.Calendar;
boolean savePDF = false;

//add your variables here
int x1=0;
int y1=0;
int x2=0;
int y2=0;
int sizeC=0;

//end variables section

void setup()
{
  size(400, 400);
  
  background(255);


}

void draw()
{
   // this line will start pdf export, if the variable savePDF was set to true 
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");
    
   //for loop 
   //
   
   
   for (int i=0; i < 100; i=i+1) { 
      //do stuff 
      x1 = int(random(width));
      y1 = int(random(height));
      x2 = int(random(width));
      y2 = int(random(height));
      sizeC = int(random(15,50));
      
     //add your code  here
      noFill();
      ellipse (x1,y1,sizeC,sizeC);
      line(x1,y1,x2,y2);
      ellipse (x2,y2,sizeC,sizeC);
   }  
   
   
   noLoop();
    
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

      x1 = int(random(width));
      y1 = int(random(height));
      x2 = int(random(width));
      y2 = int(random(height));
     //add your code  here
      stroke(255,20,36);
      fill(255,0,0,15);
      ellipse (x1,y1,50,50);
      line(x1,y1,x2,y2);
      ellipse (x2,y2,50,50);
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


