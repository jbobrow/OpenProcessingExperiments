
void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{
  if (mousePressed == false)
  {
    background(255);
    translate(0,0);

    for (int i=0; i<360; i+=20)
    {
      pushMatrix();
      rotate( radians(i) );
      translate(0, sin(millis()/3000.0)*300);
      noStroke();
      fill(10, 10, 10, 20);
      rect(0, 0, 500, 500);
      popMatrix();
    }
  }
  else if (mousePressed == true)
  {
    {
    background(0);
    translate(500,500);

    for (int i=0; i<360; i+=20)
    {
      pushMatrix();
      rotate( radians(i) );
      translate(0, sin(millis()/10.0)*500);
      noStroke();
      fill(255, 255, 255, 50);
      rect(0, 0, 500, 500);
      popMatrix();
    }
  }
  }
}

