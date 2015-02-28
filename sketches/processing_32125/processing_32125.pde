
//import processing.pdf.*;

int yea =250;
int no = 250;
int F = 255;
int E = 0;
int Q = 0;
int W = 500;
int M = 0;

int OK = 500;


void setup()
{
  smooth();
  size(1000, 500);
  //beginRecord(PDF, "movement3.pdf");
  smooth();
  background(0);
  
}

void draw()
{
  
  strokeWeight(M);
  smooth();
  stroke(F, 100);
  line(yea,0,no,500);
  yea = yea + 5;
  no = no + 50;
  
  
  line(0, OK, 1000, OK);
  OK = OK - 10;
  
  M = M + 1;
  
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

