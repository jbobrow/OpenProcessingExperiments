
int strokeSize = 10;
boolean first = true;
float x;
float y;
float xCenter = 250;
float yCenter = 250;
float radius = 50;
void setup()
{
  size(500,500);
  background(52);
  frameRate(11);
}

void draw()
{
  fill(52,10);
  rect(0,0,width,height);
  makeLines();
}

void makeLines()
{
  strokeWeight(random(10));
  x = (cos(radians(random(360))) * radius) + xCenter;
  y = (sin(radians(random(360))) * radius) + yCenter;
  if(mousePressed == true){
    x = mouseX;
    y = mouseY;
  }
 // strokeWeight(strokeSize);
  stroke(255);
  line(x, y, xCenter, yCenter);
  xCenter = x;
  yCenter = y;
}

