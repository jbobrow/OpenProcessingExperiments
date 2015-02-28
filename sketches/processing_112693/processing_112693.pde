
float angle = 0;
float s = 1;
float scaleSpeed = 0.01;
PImage skull;

void setup()
{
  size(500, 500);
  skull = requestImage("skull.jpg");
  frameRate(30);
}

void draw()
{
  background(0);
  angle += 0.1;
  s += scaleSpeed;
  
  if (s > 3 || s < 0)
  {
    scaleSpeed = -scaleSpeed;
  }
  
  //rotate(radians(45));
  float degrees = radians(45);
  rectMode(CENTER);
  
  pushMatrix();
  
  translate(300, 300);
  rotate(angle);
  scale(s);
  rect(0, 0, 100, 100);
  
  if (skull.width > 0)
  {
    image(skull, 0, 0, 100, 100);
  }
  
  popMatrix();
  
  
  pushMatrix();
  rotate(angle);
  rect(100, 100, 50, 50);
  popMatrix();
  
  rotate(angle);
  rect(20, 100, 50, 50);
  
  scale(s);
  rotate(angle);
  rect(150, 100, 50, 50);
}


