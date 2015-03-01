
import processing.pdf.*;
import java.util.Calendar;
boolean savePDF = false;

//add your variables here
int x1=0;
int y1=0;
int x2=0;
int y2=0;
int sizeC=0;
int alpha = 0;
boolean auto = false;

//end variables section

void setup()
{
  size(800, 800);
  
  background(#161717);


}

void draw()
{
   // this line will start pdf export, if the variable savePDF was set to true 
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");
   
  //for loop
  if (auto == true) {
    for (int i = 0; i < 10; i=i+1) {
    //do stuff
      x1 = int(random(width));
      y1 = int(random(height));
      x2 = int(random(width));
      y2 = int(random(height));
      sizeC= int(random(50, 400));
      alpha = int(random(0, 125));
     //add your code  here
      //noFill();
      fill(#137986, alpha);
      ellipse (x1,y1,sizeC,sizeC);
      line(x1,y1,x2,y2);
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
// code that happens when the mouse button
// is pressed
   for (int i = 0; i < 10; i=i+1) {
      x1 = int(random(width));
      y1 = int(random(height));
      x2 = int(random(width));
      y2 = int(random(height));
      alpha = int(random(0, 125));
     //add your code  here
      stroke (#D8FF03);
      //noFill();
      fill(#D8FF03, alpha);
      ellipse (x1,y1,50,50);
      line(x1,y1,x2,y2);
      ellipse (x2,y2,50,50);
   }
}

void mouseReleased()
{
// code that happens when the mouse button
// is released
}

//don't change this

void keyPressed() {
  
  if (key=='1' ) {
   auto = true;
  }

  if (key=='2')  {
    auto = false;
    loop();
  } 
  //key s or p for saving and printing
  if (key=='s' || key=='S') saveFrame(timestamp()+"_##.png");
  if (key=='p' || key=='P') savePDF = true;
  
}

//creates a timeStamp String
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
