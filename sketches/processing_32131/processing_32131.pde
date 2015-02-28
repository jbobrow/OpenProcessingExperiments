
//import processing.pdf.*;
int yea =0;
int no = 0;
int F = 150;
int E = 100;
int Q = -10;
int W = 0;
int M = 50;
int ha = 0;
int OK = 0;
int KO = 0;

void setup()
{
  
  size(1000, 500);
  //beginRecord(PDF, "movement7.pdf");
  background(0);
  smooth();
}

void draw()
{
  smooth();
  fill(255, M);
 

stroke(F, 100);
  //line(yea,500,no,500);
  //line(yea, 500, yea, 500);
  //yea = yea + 2;
  //no = no + 20;
  
  //line(OK, yea, yea, 500);
  line(OK, 0, 1000, OK);
  OK = OK + 15;
  
  yea = yea + 2;
  no = no + 25;
  
  line(no, 0, yea, 500);
  
  
  //line(ha, no, no, 500);
  
  //line(0, 0, 0, 0);
  
  
  //line(0, 0 ,0, 0);
  
  
  

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

