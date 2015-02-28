
// hw3
// Copyright Melissa Mak, September 2013, Pittsburgh, PA

float x, y, wd, ht;
color col;

void setup()
{
  size(400, 400);
  x = 0;
  y = 0;
  wd = width;
  ht = height;
  col = color(random(255), random(255), random(255));
  stroke(255);
  frameRate(10);
}

void draw()
{
  rect(0, 0, width, height);
  fill(255, 255, 255);
  strokeWeight(1);
  line(0, 0, mouseY, mouseX);
  line(100, 0, mouseY, mouseX);
  line(200, 0, mouseY, mouseX);
  line(300, 0, mouseY, mouseX);
  line(400, 0, mouseY, mouseX);
  line(0, 400, mouseY, mouseX);
  line(100, 400, mouseX - pmouseX, mouseY - pmouseY);
  line(200, 400, mouseX - pmouseX, mouseY - pmouseY);
  line(300, 400, mouseX - pmouseX, mouseY - pmouseY);
  line(400, 400, mouseX - pmouseX, mouseY - pmouseY);

}

void mouseMoved()
{
  line(10 + mouseX, 100 + mouseY, random(mouseX), random(mouseY));
  fill(10, 10, 10, 100);
  ellipse(200, 200, mouseX - mouseY, mouseY - mouseX);
  ellipse(100, 200, mouseX - mouseY, mouseY - mouseX);
  ellipse(300, 200, mouseX - mouseY, mouseY - mouseX);

}

void mousePressed() 
{
  fill(col);
  col = color(random(255), random(255), random(255));
}



