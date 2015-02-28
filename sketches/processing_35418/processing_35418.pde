
void setup()
{ 
  size(700,400);
  background(255);
  stroke(0,30);
  smooth();
}

float x,y,rad;
int d=0;
float s=5;

void draw()
{
  d=d+15; 
  rad=(PI/180)*d;
  x=sin(rad)*s+(width/2);
  y=cos(rad)*s+(height/2);

  fill(mouseX,232,99,40);
  ellipse(x,y,30,30);

s = s+0.4;

if(s>400){s=5;}

}  

