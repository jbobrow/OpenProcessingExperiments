
void setup()
{ 
  size(700,400);
  background(0);
  stroke(0);
  smooth();
}

float x,y,rad;
int d=0;
int s=100;

void draw()
{
  d=d+10; 
  rad=(PI/180)*d;
  x=sin(rad)*s+(width/2);
  y=cos(rad)*s+(height/2);
  background(0);
  fill(99,232,38,60);
  ellipse(x,y,50,50);
}  

