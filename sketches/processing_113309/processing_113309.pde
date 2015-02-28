
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
  strokeWeight(10);
}

void draw()
{
  timer = timer + 0.0167;  //(1 / 60.0)
  radiusTimer = radiusTimer + .4;
  animationTimer = animationTimer + 0.0067;
  angle += .2;
  
  if (angle > TWO_PI)
  {
    angle = 0;
  }
  
  if (timer >= 0)
  {
    drawRainbow();
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
    hue += 2;
  fill(hue, 100, 100);
  if(hue >= 360)
  {
    hue = 0;
  }
    noStroke();
    pushMatrix();
    translate(width/2, height/2);
    rotate(angle * 5);
    arc(0, 0, 130, 130, PI, TWO_PI);
    popMatrix();
  }
  
    if (timer >= 5.5)
  {
    drawCircle2(radiusTimer);
    hue += 2;
    fill(hue, 100, 100);
    if(hue >= 360)
    {
      hue = 0;
    }
    stroke(hue, 99, 99);
    drawCircle2(50 + radiusTimer);
    drawCircle2(25 + radiusTimer);
  }
  
  if (timer >= 8)
  {
    filter(INVERT);
    radiusTimer = radiusTimer - 4;
    drawCircle(1 + radiusTimer);
    drawCircle(5 + radiusTimer);
    drawCircle(10 + radiusTimer);
    drawCircle(15 + radiusTimer);
    drawCircle(20 + radiusTimer);
    drawCircle(25 + radiusTimer);
    drawCircle(30 + radiusTimer);
    drawCircle(35 + radiusTimer);
    drawCircle(40 + radiusTimer);
    drawCircle(60 + radiusTimer);
    drawCircle(65 + radiusTimer);
    drawCircle(70 + radiusTimer);
    drawCircle(75 + radiusTimer);
    drawCircle(80 + radiusTimer);
    drawCircle(85 + radiusTimer);
    drawCircle(90 + radiusTimer);
  }
  
  if (timer >= 10)
  {
    timer = 0;
  }
  else if (animationTimer >= 7)
  {
    drawEllipse3();
    scale(-angle/(random(65)));
  }  
  
}

float ellipseX = 0.0;

void drawEllipse1()
{
  ellipseX += 1;
  
  if (ellipseX > width)
  {
    ellipseX = 0;
  }
  
  float waveSpeed = 10;
  float waveHeight = 100;
  float angle = radians(ellipseX * waveSpeed);
  float ellipseY = sin(angle) * 100;
  fill(hue, 100, 100);
  ellipse(ellipseX, height/2 + ellipseY, 100, 100);
  
  //Add cosine
  ellipseY = cos(angle) * waveHeight;
  ellipse(ellipseX, height/2 + ellipseY, 100, 100);
  ellipse(height/2 + ellipseY, ellipseX, 100, 100);
}


void drawEllipse()
{
  ellipse(width/2, height/2, width/4, height/4);
}

void drawEllipse2()
{
  hue += 2;
  fill(hue, 100, 100);
  if(hue >= 360)
  {
    hue = 0;
  }
  ellipse(width/2, height/2, width/2, height/2);
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

void drawRainbow()
{
  for (int i = 0; i < width; i = i + 1)
  {
    float percent = i / (float)width;
    stroke(hue, 100, 100 * percent);
    line(i, 0, i, height);
  }
}

void drawCircle(float radius)
{
  int centX = height/2;
  int centY = width/2;
  
  float x, y;
  float lastx = centX + (radius * cos(0));
  float lasty = centY + (radius * sin(0));
  for (float ang = 0; ang <= 360; ang += 40)
  {
    float rad = radians(ang);
    x = centX + (radius * cos(rad));
    y = centY + (radius * sin(rad));
    ellipse(x, y, 10, 10);
    lastx = x;
    lasty = y;
  }
}

void drawCircle2(float radius)
{
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
    lastx = x;
    lasty = y;
  }
}


