
// Project: MandalaPatterns 
// File: MandalaPatterns 
// Author: James Justinic 
// Date: 2/1/2010 

Point center;
int shapes = 20;

void setup()
{
  size(800, 800);
  center = new Point(width/2, height/2);
  background(255);
  smooth();
  ellipseMode(CENTER);
  rectMode(CENTER);

  drawRandomShapes(shapes);
}

void draw()
{

}

void drawRandomShapes(int count)
{
  for (int i = 0; i < count; i++)
  {
    drawCenteredShape((int)random(1, 4));
  } 
}

void drawCenteredShape(int type)
{
  fill(random(0,256), random(0,256), random(0,256), random(10, 50));

  float x = random(1, center.x()*2-50);
  float y = random(1, center.y()*2-50);

  switch(type)
  {
  case 1:
    rect(center.x(), center.y(), x, y);
    rect(center.x(), center.y(), y, x);

    pushMatrix();
    translate(center.x(), center.y());
    rotate(radians(45));
    rect(0, 0, x, y);
    popMatrix();

    pushMatrix();
    translate(center.x(), center.y());
    rotate(radians(-45));
    rect(0, 0, x, y);
    popMatrix();

    break;

  case 2:
    ellipse(center.x(), center.y(), x, y);
    ellipse(center.x(), center.y(), y, x);

    pushMatrix();
    translate(center.x(), center.y());
    rotate(radians(45));
    ellipse(0, 0, x, y);
    popMatrix();

    pushMatrix();
    translate(center.x(), center.y());
    rotate(radians(-45));
    ellipse(0, 0, x, y);
    popMatrix();

    break;

  case 3:
    int sz = (int)random(1, center.x());
    drawTriangle(center.x(), center.y(), sz, radians(0));
    drawTriangle(center.x(), center.y(), sz, radians(180));

    break;
  }
}

void drawTriangle(float x, float y, float radius, float initRot)
{
  float theta = initRot;

  beginShape(TRIANGLES);

  for (int i = 0; i < 3; i++)
  {
    float ptX = x + cos(theta)*radius;
    float ptY = y + sin(theta)*radius;
    vertex(ptX, ptY);
    theta += radians(120);
  }

  endShape();
}

void keyPressed()
{    
  background(255);
  drawRandomShapes(shapes);
}

