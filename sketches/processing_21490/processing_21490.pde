
class Car
{
  color c;
  float xpos, ypos;
  float xspeed;
  float prevM=0.0;
  float timer;
  boolean rumble;

  Car(float tx, float ty, color tc, float ts)
  {
    c = tc;
    xpos = tx;
    ypos = ty;
    xspeed = ts;
    timer = millis();
    rumble = false;
  }
  void display()
  {
    fill(50);
    rect(xpos-15, ypos-15, 10,5);
    rect(xpos-15, ypos+15, 10,5);
    rect(xpos+15, ypos-15, 10,5);
    rect(xpos+15, ypos+15, 10,5);
    fill(c);
    ellipse(xpos, ypos, 50,30);
  }

  void drive()
  {
    xpos += xspeed;
    if(xpos > width+20)
    {
      xpos = -20;
    }
  }
  void sputter()
  {
    if(millis()-prevM >= 1000)
    {
      rumble=!rumble;      
      prevM += 1000;
    }

    if(rumble)
    {
      xpos += random(-3.0,3.0);
      ypos += random(-1.5,1.5);
    }
  }
}


