
//import processing.pdf.*;
int yea =0;
int no = 100;
int F = 255;
int E = 0;
int Q = 0;
int W = 500;
int M = 0;
void setup()
{
  
  size(1000, 500);
 // beginRecord(PDF, "movement1.pdf");
  smooth();
  background(0);
  
  
  
  
}
void draw()
{
  
  
  
  
  
  strokeWeight(1);
  smooth();
  stroke(F, 100);
  line(yea,0,no,500);
  yea = yea + 2;
  no = no + 25;
  
  line(no, 0, yea, 500);
  
  M = M + 1;
  
 /* 
  line(Q,mouseX,Q,mouseY);
  Q = Q + 5;
  */
  
 
  
  
}
/*
void keyPressed() {
  if (key == 'q') {
    endRecord();
    
  }
}
*/

/*
void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}
*/

