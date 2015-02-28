
float s = 1;
float scaleSpeed = 0.01;
float angle = 0;
float counter = 0;
float radius = 100;
float x, y;

void setup()
{
  size(500, 500);
}

void draw()
{
  counter += 0.05;
  
  rectMode(CENTER);
  s += scaleSpeed;
  if(s>2 || s<0.5)
  {
    scaleSpeed = -scaleSpeed;
  }
  
  pushMatrix();
  background(0);
  scale(s);
  rect(0, 0, 100, 100);
  popMatrix();
  float centx = width/2;
  float centy = height/2;
  float lastx = centx + (radius*cos(0));
  float lasty = centy + (radius*sin(0));
  for(int a = 0; a < 360; a++)
  {
   stroke(360, 0, 100);
   float rad = radians(a);
   x = centx + (radius*cos(rad));
   y = centy + (radius*sin(rad));
   line(lastx, lasty, x, y);
   lastx = x;
   lasty = y;
  }

  if(counter>5)
  {
    angle += 0.1;
    translate(width/2, height/2);
    rotate(angle);
    rect(0, 0, 100, 100);  
  }
  else
  {
    ellipse(400, 400, radius, radius);
  }
  
}


