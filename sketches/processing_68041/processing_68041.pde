
float inicio=0.0;
float fin=0.0;
float x=0;
int ti=0;

void setup()
{
  size(700,500);
  noFill();
  smooth();
  background(255);
  frameRate(5);
}

void draw(){
  background(0);
  if(ti == 0)
  {
    inicio = QUARTER_PI;
    fin = PI+HALF_PI+QUARTER_PI;
    ti=1;
  }
  else
  {
    inicio = 0;
    fin = TWO_PI-0.02;
    ti=0;
  }
  fill(255,255,0);
  arc(250,250,150,150,inicio,fin);
  
  
  
  
}

