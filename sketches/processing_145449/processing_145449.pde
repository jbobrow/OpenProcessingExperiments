
void setup()
{
  size(500, 500);
  smooth();
  background(255);
}

void draw()
{
  if (mousePressed == false)
  {
    background(255);
    translate(250, 250);

    for (int i=0; i<360; i+=10)
    {
      pushMatrix();
      rotate(radians(i));
      translate(0, sin(millis()/2000.0)*50);
      noStroke();
      fill(200, 0, 0, 20);
      ellipse(0, 0, 100, 100);
      popMatrix();
    }
  }
  if (mouseX >=200 && mouseX <=300  )
  {
    {
      background(255);
      translate(0,0);
      float r = random(10, 200);

      for (int i=0; i<360; i+=10)
      {
        pushMatrix();
        rotate(radians(i));
        translate(sin(millis()/2000.0)*r, sin(millis()/2000.0)*30);
        noStroke();
        fill(255, 0, 0, 20);
        ellipse(0, 0, r, r);
        popMatrix();
      }
    }
  }
}

