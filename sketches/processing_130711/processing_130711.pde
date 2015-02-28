
PImage triangle;
color brushColor;
PImage paletteImage;
PImage customBrush;
float someRotate = 0.1;
float someScale = 0.1;

void setup()
{
  size(500,500);
  background(255);
  paletteImage = requestImage("original.png");
  customBrush = new PImage(500, 500);
}


void draw()
{
  noStroke();
 
 if (paletteImage.width > 0)
 {
   image(paletteImage, 0, 0, 100, 100);
 }
 if (mousePressed == true)
 {
   if (mouseButton == LEFT)
   {
     pushMatrix();
     translate(mouseX, mouseY);
     rotate(someRotate);
     scale(someScale);
     fill(brushColor);
     imageMode(CENTER);
    triangle(-30, 30, 0, -30, 30, 30);
     popMatrix();
     imageMode(CORNER);
   }
   if (mouseButton == RIGHT)
   {
     brushColor = get(mouseX, mouseY);
   }
   if (keyPressed == true)
   {
     if (key == '1')
     {
       someScale = someScale + 0.2;
     }
      if (key == '2')
      {
        someScale = someScale - 0.2;
      }
      if (key == '3')
      {
        someRotate = someRotate + 0.2;
      }
      if (key == '4')
      {
        someRotate = someRotate - 0.2;
      }
   }
   fill(brushColor);
 }
}


