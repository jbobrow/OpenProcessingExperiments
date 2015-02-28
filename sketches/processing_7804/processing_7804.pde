
// Keith O'Hara <kohara@bard.edu>
// Feb 22 2010 Lecture

float angle;

void setup()
{
  size(400, 400);
  stroke(196);
  smooth();
  strokeWeight(10);
  PFont font = loadFont("Tahoma-Bold-48.vlw");
  textFont(font);
  textAlign(CENTER);
  angle = 0;
}

void draw()
{
  background(24);
  float distance = dist(width/2, height/2, mouseX, mouseY);
  float x = 200 + distance*cos(radians(angle));
  float y = 200 + distance*sin(radians(angle));
  text(int(angle) % 360, 200, 200);
  point(x, y);
  angle = angle + 1; 
}

