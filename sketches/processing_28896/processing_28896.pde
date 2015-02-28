
void setup()
{
  size(500,500);
  background(255);
  stroke(255);
  smooth();
  frameRate(24);
}


float x1,y1, rad1;
int deg=0;
int r=150;
int g=200;
int b=240;


void draw()
{
 deg=deg+5;
 rad1=(PI/180)*deg;
 x1=sin(rad1)*100 + (width/2);
 y1=cos(rad1)*100 + (height/2);
 background(255);
 fill(r,g,b);
 ellipse(x1,y1,50,50);
 
 if(deg >= 360)
 {
     r = int (random(100, 255));
     g = int (random(100, 255));
     b = int (random(100, 255));
     deg=0;
 }
 
 else if(deg==180 || deg==90 || deg==270)
 {
     r = int (random(100, 255));
     g = int (random(100, 255));
     b = int (random(100, 255));
 }
}







