
float x=0;
float y = 0;
float a = 0;

void setup() {
  size(400, 400);
  smooth();
  x=width/2;
  y=height/2;
  background(0);
  noStroke();
  frameRate(100);
}
int a2=0;
void draw() 
{

  ellipse(x, y, 2, 2);
  x+=cos(radians(a))*2;
  y+=sin(radians(a))*2;
  a+=3;
}


