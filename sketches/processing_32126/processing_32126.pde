
//import processing.pdf.*;

int yea =0;
int no = 100;
int F = 255;
int E = 0;
int Q = 0;
int W = 500;
int M = 0;

int OK = 0;


void setup()
{
 
  size(1000, 500);
  //beginRecord(PDF, "movement4.pdf");
   smooth();
  background(0);
  
}

void draw()
{
  fill(0,10);
  strokeWeight(M);
  smooth();
  stroke(F, 100);
  ellipse(yea,0,no,1000);
  yea = yea + 5;
  no = no + 10;
  
  if(no > 3000) 
  {
    no = 0;
  }
  
  line(0, OK, 1000, OK);
  OK = OK + 10;
  
  
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

