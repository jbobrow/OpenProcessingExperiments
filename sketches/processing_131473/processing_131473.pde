
float timer = 0.0;
float rad = 1;
color brushColor;
PImage Doge;
PImage Color;


void setup()
{
  size(500,500);
  background(random(255), random(255), random(255), random(255));
  Doge = requestImage("Doge.jpg");
  Color = requestImage("Color.jpg");
}

void draw()
{
    if (Color.width > 0)
    {
      image(Color, 0, 0, 150, 150);
    }
  if (mousePressed == true);
  {
    fill(brushColor);
  
    if (mouseButton == LEFT)
    {
      if (key == '1')
      {
      rect(mouseX, mouseY, 100, 100);     
      }
      if (key == '2')
      {
      pushMatrix();
      
      translate(mouseX + random(5), mouseY + random(5));
      image(Doge, 0, 0, 100, 100);
      fill(random(255), random(255), random(255), random(255));
      popMatrix();
      }
      if (key == '3')
      {
        pushMatrix();
   fill(random(255),random(255),random(255),random(255));
    stroke(3);
    translate(mouseX + random(50), mouseY + random(50));
    rotate(rad);
    triangle(25, 80, 63, 30, 91, 80);
  
    popMatrix();
      }
  }
  if (mouseButton == RIGHT)
  {
    brushColor = get(mouseX, mouseY);
  }
    
  }
}


