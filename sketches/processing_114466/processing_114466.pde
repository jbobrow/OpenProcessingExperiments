
void setup() {
  size(600, 600);
  smooth();
  noStroke();
  ellipseMode(CENTER);
}
 
int numObjects = 10;
int centerX = 300;
int centerY = 300;
float distance = 100;
float angle = 0;
float angleObject = 360/numObjects;
 
void draw() {
  background(0);
  angle--;
 
  for (int i=0;i<numObjects ;i++)
  {
    pushMatrix();
    translate(centerX, centerY);
    rotate(radians(i*angleObject + angle));
    int s = second();
if (s%2 == 0)
  {
  right(0, distance);
}
else
  {
    left (0, distance);
  }
    popMatrix();
  }
}

void right(float x, float y)
{
ellipse(x, y+50, 50, 50);
beginShape();
  vertex(x-25, y+50);
  vertex(x-25, y+200);
  vertex(x-10, y+200);
  vertex(x-20, y+195);
  vertex(x-15, y+125);
  vertex(x+15, y+125);
  vertex(x+85, y+125);
  vertex(x+85, y+110);
  vertex(x+80, y+120);
  vertex(x+25, y+115);
  vertex(x+25, y+50);
  endShape();
}

void left(float x, float y)
{
ellipse(x, y+50, 50, 50);
beginShape();
  vertex(x-25, y+50);
  vertex(x-25, y+125);
  vertex(x+50, y+125);
  vertex(x+50, y+110);
  vertex(x+45, y+120);
  vertex(x-15, y+115);
  vertex(x+15, y+115);
  vertex(x+15, y+200);
  vertex(x+30, y+200);
  vertex(x+20, y+195);
  vertex(x+25, y+50);
  endShape();
}


