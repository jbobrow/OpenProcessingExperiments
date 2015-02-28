
//import processing.pdf.*;
int yea =-5;
int no = -5;
int F = 255;
int E = 2;
int Q = -10;
int W = -10;
int M = 20;

int OK = -300;
int KO = -300;

void setup()
{

  size(1000, 500);
  //beginRecord(PDF, "movement5.pdf");
  smooth();
  background(0);
  
}

void draw()
{
  smooth();
  noStroke();
  fill(255, M);
  triangle(Q, W, OK, no, yea, KO);
  
  Q = Q +10;
  W = W + 10;
    
  yea = yea + 1;
  no = no + 40;
  
  OK = OK + 20;
  KO = KO + 20;
  
  //M = M + 20;
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

