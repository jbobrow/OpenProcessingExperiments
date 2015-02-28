
/* Carvajal Santos Christian Uziel
	 PACMAN */

float inicio=0.0;
float fin=0.0;
float x=0;
int t=0,t1=0;

void setup()
{
  size(300,300);
  noFill();
  smooth();
  background(255);
  frameRate(8);
}

void draw(){
  background(0);
  if(t == 0)
  {
    inicio = QUARTER_PI;
    fin = PI+HALF_PI+QUARTER_PI;
    t=1;
  }
  else
  {
    inicio = 0;
    fin = TWO_PI-0.01;
    t=0;
  }
  fill(255,255,0);
  arc(150,150,200,150,inicio,fin);
  
  fill(0,0,0);
  strokeWeight(10);
  arc(150,120,0,1,0,0);
  
  strokeWeight(10);
  arc(248,150,30,30,0,0);
  arc(288,150,30,30,0,0);
}

