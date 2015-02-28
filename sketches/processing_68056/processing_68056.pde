
float x = 100;
float xspeed = 35;
float inicio = 0;
float fin = 0;
int t = 0;


void setup()
{
  size(500,500);
  smooth();
  background(255);
  frameRate(1);
}

void draw(){
  background(0);
  x = x + xspeed;
  
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  }


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
  arc(x+40,120,150,150,inicio,fin);
  
  fill(0,0,0);
  strokeWeight(20);
  arc(x+20,100,0.5,50,0,0);
  

}

