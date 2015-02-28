
float timer = 0;
float hue = 0;
float ellipseX = 0.0;
float angle = 0.0;

void setup()
{
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
}

void draw()
{
  timer = timer + 0.0167;
  
  hue = hue + 1;
  
  if (hue >= 360)
  {
    hue = 0;
  }
  
  if (timer > 0)
  {
    drawGradient();
  }
  
  if (timer > 20)
  {
    drawEllipse();
  }
  drawCircle (47);
  drawCircle (213);
  drawCircle (100);
  
  if (timer > 4 && timer < 10)
  {
    noStroke();
    ellipse(30, 20, 50, 50);
    ellipse(100, 120, 40, 40);
    ellipse(400, 20, 118, 114);
    ellipse(200, 200, 52, 47);
    ellipse(117, 356, 80, 80);
    ellipse(300, 300, 20, 20);
    ellipse(215, 215, 40, 40);
    ellipse(345, 356, 80, 80);
    ellipse(400, 400, 50, 50);
  }
  if (timer > 10 && timer < 20)
  {
    drawBox();
  }
  

}
void drawCircle(float radius)
{
  int centX = width / 2;
  int centY = height / 2;
  
  float x, y;
  float lastx = centX + (radius * cos(0));
  float lasty = centY + (radius * sin(0));
  for (float ang = 0; ang <= 360; ang += 5)
  {
    float rad = radians(ang);
    x = centX + (radius * cos(rad)) + random(-20, 20);
    y = centY + (radius * sin(rad)) + random(-9, 4);
    ellipse(x, y, 47, 47);
    line(lastx, lasty, x, y);
    lastx = x;
    lasty = y;
  }
}

void drawGradient()
{
  for (int i = 0; i < width; i = i + 1)
  {
    float percent = i / (float)width;
    stroke(hue, 100, 100 * percent);
    line (i, 0, i, height);
  }
}


void drawEllipse()
{
  ellipseX += 1;
  
  if (ellipseX > width)
  {
    ellipseX = 0;
  }
  
  float waveSpeed = 40;
  float waveHeight = 100;
  float angle = radians(ellipseX * waveSpeed);
  float ellipseY = sin(angle) * waveHeight;
  
  fill(hue, 100, 100);
  ellipse(ellipseX, height/4 + ellipseY, 150, 150);
  ellipse(height/6 + ellipseY, ellipseX, 100, 100);
  
  ellipseY = cos(angle) * waveHeight;
  ellipse(ellipseX, height/9 + ellipseY, 125, 125);
}

void drawBox()
{
  angle += 0.1;
  if (angle > TWO_PI)
  angle = 0;
  
  rectMode(CENTER);
  pushMatrix();
  translate(height/2, width/2);
  rotate(angle);
  rect(0, 0, 300, 300);
  popMatrix();
  scale(angle);
  
  rectMode(CENTER);
  pushMatrix();
  translate(height/4, width/4);
  rotate(angle);
  rect(20, 20, 10, 10);
  popMatrix();
  scale(angle);
  
  rectMode(CENTER);
  pushMatrix();
  translate(height/5, width/2);
  rotate(angle);
  rect(50, 5, 150, 150);
  popMatrix();
  scale(angle);
  
  rectMode(CENTER);
  pushMatrix();
  translate(height/9, width/4);
  rotate(angle);
  rect(60, 80, 30, 30);
  popMatrix();
  scale(angle);
  
  rectMode(CENTER);
  pushMatrix();
  translate(height/9, width/3);
  rotate(angle);
  rect(4, 4, 150, 120);
  popMatrix();
  scale(angle);
  
  rectMode(CENTER);
  pushMatrix();
  translate(width/4, height/2);
  rotate(angle + 60);
  rect(50, 5, 150, 150);
  popMatrix();
  scale(angle + 5);
  
  rectMode(CENTER);
  pushMatrix();
  translate(height/6, width/6);
  rotate(angle);
  rect(0, 0, 150, 150);
  popMatrix();
  scale(angle * angle);
}



