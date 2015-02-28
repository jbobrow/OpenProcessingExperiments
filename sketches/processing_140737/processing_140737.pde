
color brushcolor;
PImage colorwheel;
PImage rat;
float brushscale = 1.0;
float brushrotate = 0.0;

void setup()
{
  size(500, 500);
 rat = requestImage("rat-model-md.png");
 colorwheel = requestImage("color_wheel_730.png");
 background(255);
 
}
void draw()
{
  noStroke();
  if (colorwheel.width > 0);
  {
    image(colorwheel, 0, 0, 150, 150);
  }
   if (mousePressed == true)
   {
    if (mouseButton == LEFT)
    {
      if (key == '1')
      {
        pushMatrix();
        translate(mouseX, mouseY);
        rotate(brushrotate);
        scale(brushscale);
        ellipse(0, 0, 15, 15);
        popMatrix();
      }
else if (key == '2')
        {
          if (rat.width > 0)
          {
          image(rat, mouseX, mouseY, 50, 50);
          }
        }
    else if (key == '3')
      {
      pushMatrix();
      rotate(brushrotate);
      scale(brushscale);
      rect(mouseX + random(100), mouseY + random(100), 50, 50);
      popMatrix();
      }
    } 
    if (mouseButton == RIGHT)
      {
      brushcolor = get(mouseX, mouseY);
      }    
    if (key == 'q')
    {
      background(255);
      image(colorwheel, 0, 0, 150, 150);
    }
      fill(brushcolor);
  }
}



