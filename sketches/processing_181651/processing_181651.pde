
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
int units = 0;
int alpha = 0;
int R = 0;
int G = 0;
int B = 0;
boolean auto = true;
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
   
  if(auto == true){ 
     units = int(random(10,100));
     for(int i = 0; i < units; i =i+1){
      x1 = int(random(width));
      y1 = int(random(height));
      x2 = int(random(width));
      y2 = int(random(height));
      sizeC = int(random(20,80));
      alpha = int(random(0,255));
      R = int(random(0,255));
      G = int(random(0,255));
      B = int(random(0,255));
      
      fill(R,G,B,alpha);
      ellipse (x1,y1,sizeC,sizeC);
      stroke(R,G,B,alpha);
      line(x1,y1,x2,y2);
      fill(R,G,B,alpha);
      ellipse (x2,y2,sizeC,sizeC);
     }
     noLoop();
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
     x1 = int(random(width));
      y1 = int(random(height));
      x2 = int(random(width));
      y2 = int(random(height));
     //add your code  here
      stroke(180,20,180);
      fill(0,75);
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


