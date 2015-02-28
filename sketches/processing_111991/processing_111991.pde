
float angle = 0.0;
float timer = 0;
float ellipseX = 0.0;

void setup()
{
  size(500, 500);
  colorMode(HSB, 360, 100, 100, 100);
  background(47);
}

void draw()
{
  timer = timer + 0.0167;
  
  if (timer > 20)
  {
    ellipseX += 1;
    
    float waveSpeed = 10;
    float waveHeight = 100;
    float centerY = height/2;
    float a = radians(ellipseX * waveSpeed);
    float offset = sin(a) * waveHeight;
    float ellipseY = centerY + offset;
    ellipse(ellipseX, ellipseY, 100, 100);
  }
  if (timer > 5 && timer < 15)
  {
    angle += 0.1;
    if (angle > TWO_PI)
    angle = 0;
    
    rectMode(CENTER);
    pushMatrix();
    translate(height/2, width/2);
    rotate(angle);
    rect(0, 0, 200, 200);
    popMatrix();
  }
  else 
  {
  angle += 0.1;

  rectMode(CENTER);
  pushMatrix();
  translate(250, 250);
  rotate(CENTER);
  rect(125, 125, 100, 100);
  popMatrix();
  
  rotate(radians(5));
  scale(angle);
  rect(250, 250, 100, 100);
  }

}


