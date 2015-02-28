
float r = 0;
float s = 1;
float scaleSpeed = 0.01;
float radius = 100;
float t = 0;

// r means rotate variable
// s means scale variable

void setup()
{
  size(500, 500);
}

void draw()
{
  //background(0);
  r += 0.1;
  s += scaleSpeed;
  t += 0.0167;
  if (s > 2 || s < 0.01)
  {
    scaleSpeed = -scaleSpeed;
  }
  float degrees = radians(45);
  rectMode(CENTER);
  
  if (t < 5)
  {
    pushMatrix();
    translate(width/2, height/2);
    smooth();
    fill(242, 29, 168);
    rotate(r);
    scale(s);
    rect(0,0,150,150);
    popMatrix();
  }
  else
  {
  
    int centX = 0;
  int centY = 0;
   
  stroke(0, 70);
  noFill();
  ellipseMode(CENTER);
  translate(width/2, height/2);
  rotate(r);
  scale(s);
  ellipse(centX,centY,radius*2,radius*2);
  strokeWeight(5);
  stroke(20, 50, 70);
  float x, y;
  float lastx = -999;
  float lasty = -999;
  for (float ang = 0; ang <= 360; ang += 5) {   
    float rad = radians(ang);  
    x = centX + (radius * cos(rad));
    y = centY + (radius * sin(rad));
    point(x,y);
  }
  }
  
  if (t > 5 && t < 10)
  {
    pushMatrix();
    translate(width/2, height/2);
    smooth();
    fill(82, 242, 29);
    rotate(r);
    scale(s);
    rect(0,0,100,100);
    popMatrix();
  }

}


