
//import processing.pdf.*;

int no = 20;
int OK = 50;

int F = 150;

int Q = -10;
int W = 0;

int M = 50;
int KO = 100;

int xco = 1250;
int yco = 0;

int gk = 0;
int kg = 500;

int mm = 0;
int nn = 0;

int vfr = 0;
int ifr = 0;


void setup()
{
  smooth();
  size(1000, 500);
  //beginRecord(PDF, "movement8.pdf");
  smooth();
  background(0);
  
}

void draw()
{
  smooth();
  fill(255, M);
 

  //noStroke();
  //rect(Q, W, OK, no);
  
  //x 
  Q = Q +20;
  //y
  W = W + 20;
  //width
  no = no + 50;
  //height
  OK = OK + 20;
  
  stroke(255, 50);
  line(0, 0, xco, yco);
  
  xco = xco - 5;
  yco = yco + 50;
  
  stroke(255, 50);
  
  //line(500, 500, gk, kg);
  
  gk = gk + 0;
  kg = kg - 50;
 
 noFill();
 ellipse(mm, nn, vfr, ifr);
 
 mm = mm + 2;
 nn = nn + 2;
 
 vfr = vfr + 50;
 ifr = ifr + 50;
 
  ellipse(mm, nn, vfr, ifr);
 
 mm = mm + 2;
 nn = nn + 2;
 
 vfr = vfr + 5;
 ifr = ifr + 100;
 
  ellipse(mm, nn, vfr, ifr);
 
 mm = mm + 2;
 nn = nn + 2;
 
 vfr = vfr + 1;
 ifr = ifr + 50;
 
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
 

