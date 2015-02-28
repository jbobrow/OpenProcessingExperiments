
/*
Click and move the mouse to make art.
Press Space to clear
Dont be a hater
*/




float weight, randomcolor;

void setup()
{
  size(800, 800);
  smooth();
  background(255);
  weight = 1.0;
}

void draw()
{
  randomcolor = (round(random (100)));
  if (randomcolor == 5)
  {
    stroke(random(255), random(255), random(255));
  }
  
  strokeWeight(weight);
  if (mousePressed)
  {
    line (mouseX, mouseY, pmouseX, pmouseY);
    line (mouseY, mouseX, pmouseY, pmouseX);
    strokeWeight(0);
    line(mouseX, mouseY, width, mouseX);
    line(mouseX, mouseY, 0, mouseX);
  }
  weight = random(10);
  if (weight <= 0)
  {
    weight = 0;
  }
  if (weight > 10)
  {
    weight = 2.0;
  }
  if (keyPressed)
  {
    if (key == ' ')
    {
      background (255);
    }
  }
}

                                  


