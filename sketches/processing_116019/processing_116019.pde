
float prevX;
float prevY;
float hue = 0;
float angle = 0.0;
float s = 0;
float e = 0.3;
float drip = 0;
float dripX = 0;
float dripY = 0;
void setup()
{
  size(600,600);
  colorMode(HSB, 360, 100, 100);
}

void draw()
{
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      noStroke();
      fill(255,0,0);
      rectMode(CENTER);
      rect(mouseX, mouseY, 35, 35);
    }
    
    if (mouseButton == CENTER)
    {
      drip+=1;
      strokeWeight(random(25));
      stroke(random(255), random(255), random(255)- (drip*10));
      line(dripX, dripY, mouseX, mouseY);
      prevX = mouseX;
      prevY = mouseY;
      dripX = prevX+60;
      dripY = prevY+60;
      drip = 0;
    }

    if (mouseButton == RIGHT)
    {
      angle += 0.1;
      if (angle > TWO_PI)
      {
        angle = 0;
      }
      rectMode(CENTER);
      pushMatrix();
      translate(mouseX, mouseY);
      scale(s, s);
      rotate(angle);
      rect(0, 0, 35, 35);
      popMatrix();
      s += e;
      if (s > 2)
      {
       e = - 0.3;
      }
      if (s < 0.5)
      {
        e = 0.3;
      }
      hue = hue + 1;
      for (int i = 0; i < 360; i = i + 1)
     {
      float percent = i / (float)360;
      stroke(hue, 100, 100 * percent);
      fill(hue, 100, 100);
     }
     if (hue >= 360)
      {
        hue = 0;
      }
    }
  }
}




