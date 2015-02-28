
//HW 3
//©Scott Alberstein 2014

float x, y, wd, ht;
float targetX, targetY;
color col;
float easing = 0.05;

void setup()
{
  size(400, 400);
  noCursor();
  smooth();
  frameRate(100);
}

void draw()
{
  targetX = mouseX;
  float dx = mouseX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }  

  targetY = mouseY;
  float dy = mouseY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
  noStroke();
  fill(255, 255, 255, 5);
  rect(0, 0, 400, 400);
  fill(col);
  ellipse(x, y, 25, 25);
}

void mousePressed()
{
  col=color (random(255), random(255), random(255));
  ellipse (mouseX, mouseY, random(300), random(300));
}


