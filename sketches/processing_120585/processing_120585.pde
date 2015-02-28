
void setup()
{
  size(500, 500);
}
void draw()
{
  background(255);
  
  fill(0);
  noStroke();
  rect(115, 110, 30, 240);
  rect(240, 110, 30, 240);
  rect(365, 254, 30, 96);
  
  {int sec = second()*4;
  fill(215, 10, 5);
  noStroke();
  rect(115, 110, 30, sec);
  }
  
  {int min = minute()*4;
  fill(215, 10, 5);
  noStroke();
  rect(240, 110, 30, min);
  }
  
  {int h = hour()*4;
  fill(215, 10, 5);
  noStroke();
  rect(365, 254, 30, h);
  }
  
}
