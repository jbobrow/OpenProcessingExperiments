

float angel = 0;
float s = 1;
float scaleSpeed = 0.01;
float t = 0;
float pinkOffset = 200;

void setup()
{
  
  
  
  
  size(500, 500);
}

void draw()
{
  t += 0.0167;
  frameRate(255);
  
  angel += 0.1;
  s += scaleSpeed;
  if (s > 3 || s < 0)
  {
    scaleSpeed = -scaleSpeed;
  }
  //rotate(radians(45));
  float degrees = radians(45);
  rectMode(CENTER);
  
  if (t > 0 && t < 25)
  {
    pushMatrix();
    translate(width/2, height/2);
    rotate(angel);
    scale(s);
    rect(0, 0, 100, 100);
    popMatrix();
  } 
 
  if (t > 25 && t < 40)
  {
    pinkOffset += 0.5;
    pushMatrix();
    fill(#F202E7);
    translate(pinkOffset, pinkOffset);
    rotate(angel);
    scale(1);
    rect(random(80, 120), random(80, 120), 50, 50);
    popMatrix();
  }
  else
  {
    fill(#7E30ED);
    pushMatrix();
    translate(200, 200);
    rotate(angel);
    scale(1);
    rect(-120, -120, 80, 80);
    popMatrix();
    fill(#21CE13);
  }
  
  

  
}


