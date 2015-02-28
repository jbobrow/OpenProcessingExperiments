
void setup()
{
  size(500,500);
  noFill();
  smooth();
  background(255);
  frameRate(1);
}

void draw(){
  background(0);
  if(t == 0)
  {
    inicio = QUARTER_PI;
    fin = PI+HALF_PI+QUARTER_PI;
    t=1;

    fill(#FFFFFF);
    arc(306,250,30,30,0,TWO_PI);
    
  }
  else
  {
    inicio = 0;
    fin = TWO_PI-0.02;
    t=0;
  }
  fill(#FFFF00);
  arc(250,250,150,150,inicio,fin);
  
  fill(#000000);
  strokeWeight(20);
  arc(220,220,30,30,0,0);
  
  strokeWeight(15);
  arc(348,250,30,30,0,0);
  arc(388,250,30,30,0,0);
  
  
  
}


float inicio=0.0;
float fin=0.0;
float x=0;
int t=0,t1=0;
