
float angle = 0.0;
float timer = 0;

void setup()
{
  size(500, 500);
  background(#DFF030);
}

void draw()
{
  angle += 0.1;
  timer += 0.0167;
  
  if (angle > TWO_PI)
  angle = 0;
  
pushMatrix();
rectMode(CENTER);
translate(350,170);
rotate(angle);
fill(#F0B030);
rect(0, 0, 85, 85);
popMatrix();

pushMatrix();
  fill(0, 0, 255);
  rotate (radians(5));
  scale(angle, angle);
  rect(250, 250, 124, 124);
  
  
  translate(210, 110);
  triangle(0, 0, 55, 95, 75, 100);
  
  translate(155, 100);
  triangle(0, 0, 55, 95, 75, 100);
  popMatrix();
  
  drawEllipse();
}

float ellipseX = 0.0;
void drawEllipse()
{
  ellipseX += 1;
  if (ellipseX > width)
  {
    ellipseX = 10;
  }
   float ellipseY = cos(radians(ellipseX * 12)) * 100;
   fill(255, 0, 0);
  ellipse(ellipseX, height/2 + ellipseY, 100, 100);

}



