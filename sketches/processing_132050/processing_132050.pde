
float rad = 0.0;
float s = 1.0;
float myscale = 0.5;
color Brush;


void setup()
{
  size(500,500);

}

void draw()
{

  noStroke();
  fill(255, 0, 0);
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      fill(0);
      ellipse(mouseX, mouseY, 25, 25);
    }
    if (mouseButton == CENTER)
    {
      fill(random(255), random(255), random(255));
      rect(mouseX + random(100), mouseY + random(100), 25, 25);
      
    }
    if (mouseButton == RIGHT)
    {
      fill(random(255), random(255), random(255));
      stroke(0);
      //translate(width/2, height/2);
      pushMatrix();
      rotate(rad);
      scale(s);
      ellipse(mouseX+20, mouseY+20, 25, 25);
      ellipse(mouseX-20, mouseY-20, 25, 25);
      ellipse(mouseX+20, mouseY-20, 25, 25);
      ellipse(mouseX-20, mouseY+20, 25, 25);
      popMatrix();
    }
    if (keyPressed)
    {
      if (key == '1')
      {
        s += 0.1;
      }
      if (key == '2')
      {
        s -= 0.1;
      }
      if (key == '3')
      {
        
      }
    }
  }
}



