
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
int y2=0;
int x2=0;
int y1=0;
int sizeC = 50;
int units = 0;

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
   units = int(random(0,100));
   for(int i = 0; i < units; i =i+1){
    x1 = int(random(width));
    y1 = int(random(height));
    x2 = int(random(width));
    y2 = int(random(height));
    sizeC = int(random(20,80));
    //units = int(random(0,200));
   //add your code  here
    fill(0,60);
    ellipse (x1,y1,sizeC,sizeC);
    stroke(230,20,30);
    line(x1,y1,x2,y2);
    fill(0,60);
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
    x1 = int(random(width));
    y1 = int(random(height));
    x2 = int(random(width));
    y2 = int(random(height));
    sizeC = int(random(20,80));
    //units = int(random(0,200));
   //add your code  here
    fill(0,70);
    ellipse (x1,y1,sizeC,sizeC);
    stroke(180,20,180);
    line(x1,y1,x2,y2);
    fill(60,70);
    ellipse (x2,y2,sizeC,sizeC);
}
   
// is pressed


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


