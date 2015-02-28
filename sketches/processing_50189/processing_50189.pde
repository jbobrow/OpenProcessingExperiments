
//homework #3: racist circles - 48257 S'12
//melissa goh copyright 2012


float dia = 20;

void setup()
{
  size(600, 400);  
  smooth();
}

void draw() 
{
  fill(255, 5);
  rect(0, 0, width, height);
  stroke(0);
  strokeWeight(3);
  line(300, 0, 300, 400);
}

void mouseDragged()
{
  if (mouseButton == LEFT)
  {
    if (mouseX > 350)
    {
      noStroke();
      fill(random(255), random(255), random(255), 50);
      ellipse(mouseX, mouseY, 100, 100);
    }
    if (mouseX < 250)
    {
      noStroke();
      fill(0, 50);
      ellipse(mouseX, mouseY, 100, 100);
    }
  }
  else if (mouseButton == RIGHT)
  {
    if (mouseX < 250)
    {
      noStroke();
      fill(random(255), random(255), random(255), 50);
      ellipse(mouseX, mouseY, 100, 100);
    }
    if (mouseX > 350)
    {
      noStroke();
      fill(0, 50);
      ellipse(mouseX, mouseY, 100, 100);
    }
  }
}



