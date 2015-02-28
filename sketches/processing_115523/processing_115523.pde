
float scaleFactor=2.1, rotationFactor=0;
color colorSelector= color(0);

void setup()
{
  size(800, 800);
  background(255);
  fill(colorSelector);
  strokeWeight(2);
  noStroke();
  smooth();
  frameRate(60);
}

void draw()
{

  noStroke();
  if (keyPressed)
  {
    if (key == 'a')
    {
      rotationFactor -= 0.1;
    }
    if (key == 'd')
    {
      rotationFactor += 0.1;
    }
    if (key == 'w')
    {
      scaleFactor += 0.2;
    }
    if (key == 's')
    {
      scaleFactor -= 0.2;
    }
  }
  if (mousePressed)
  {
    if (mouseButton==LEFT)
    {
      fill(red(colorSelector), green(colorSelector), blue(colorSelector));
      pushMatrix();
      translate(mouseX, mouseY);
      scale(scaleFactor);
      rotate(rotationFactor);
      triangle(-5, 10, 0, 0, 5, 10);
      popMatrix();
    }
  }

  for (int angle = 0; angle < 360; angle++)
  {
    colorMode(HSB, 360, 100, 100);
    pushMatrix();
    translate(50, 50);
    rotate(radians(angle));
    stroke(angle, 100, 100);
    line(0, 0, 30, 30);
    popMatrix();
  }

  colorMode(RGB);
}

void mousePressed()
{
  if (mouseButton==RIGHT)
  {
    colorSelector=get(mouseX, mouseY);
  }
}



