
color brushColor;
PImage Image;
float someScale = .05;
float someRotation = .2;


void setup()
{
  size(500, 500);
  background(random(255), random(255), random(255), random(255));
  Image = requestImage("palette.png");
}

void draw()
{
 
  noStroke();
  if (Image.width > 0)
  {
    image(Image, 0, 0, 100, 100);
  }
  
  if (mousePressed == true)
  {
    fill(brushColor);
    translate(mouseX, mouseY);
    if (mouseButton == LEFT)
    {
     pushMatrix();
     rotate(someRotation + random(25));
     scale(someScale + random(15));
     triangle(mouseX + random(20), mouseY + random(50), 90, 82, 70, 100);
     popMatrix();
    }
   if(mouseButton == RIGHT)
   {
     brushColor = get(mouseX, mouseY);
   }

  }

}



