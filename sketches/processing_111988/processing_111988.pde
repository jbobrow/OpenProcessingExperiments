
float hue = 0;
float timer = 0.0;
float radiusTimer = 0;
float animationTimer = 0;
float angle = 0;

void setup()
{
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  stroke(0, 0, 0);
  strokeWeight(5);
}

void draw()
{
  timer = timer + 0.0167;  //(1 / 60.0)
  radiusTimer = radiusTimer + .4;
  animationTimer = animationTimer + 0.0067;  //(1 / 60.0)
  angle += .2;
  
  if (angle > TWO_PI)
  {
    angle = 0;
  }
  
  drawEllipse();
  
  if (timer >= .5)
  {
    drawCircle(radiusTimer);
  }
  
  if (timer >= 1)
  {
    drawCircle(50 + radiusTimer);
  }
  
  if (timer >= 2 && timer <= 5)
  {
    rectMode(CENTER);
    pushMatrix();
    translate(width/2, height/2);
    rotate(angle);
    scale(angle/(random(65)));
    rect(0, 0, 150, 150);
    popMatrix();
  }
  
  if (timer >= 6)
  {
    timer = 0;
  }
  else if (animationTimer >= 7)
  {
    drawEllipse3();
    scale(-angle/(random(65)));
  }  
}

void drawEllipse()
{
  ellipse(width/2, height/2, width/4, height/4);
}

void drawEllipse3()
{
  hue += 2;
  fill(hue, 100, 100);
  if(hue >= 360)
  {
    hue = 0;
  }
  ellipse(width/2, height/2, width/6, height/6);
}

void drawCircle(float radius)
{
  //float radius = 100;
  int centX = height/2;
  int centY = width/2;
  
  float x, y;
  float lastx = centX + (radius * cos(0));
  float lasty = centY + (radius * sin(0));
  for (float ang = 0; ang <= 360; ang += 1)
  {
    float rad = radians(ang);
    x = centX + (radius * cos(rad));
    y = centY + (radius * sin(rad));
    ellipse(x, y, 10, 10);
    //line(lastx, lasty x, y);
    lastx = x;
    lasty = y;
  }
}


