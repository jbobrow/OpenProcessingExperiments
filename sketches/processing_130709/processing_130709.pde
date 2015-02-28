
float someScale = 1.0;
float someRotation = 1.0;
PImage paletteImage;
color brushColor;



void setup()
{
  size(500, 500);
  background(255);
  paletteImage = requestImage("colorwheel-rgb.jpg");
}

void draw()
{

  noStroke();
  fill (200, 255, 0);
    if (mousePressed == true)
  {
    if (mouseButton ==LEFT)
    {
      pushMatrix();  
      translate(mouseX, mouseY);
      rotate(someRotation);  
      scale(someScale);
      fill(brushColor);
      triangle(0, 0, 20, 60, 45, 90);
      popMatrix();
    }
    if (mouseButton == RIGHT)
   {brushColor= get(mouseX, mouseY);}
   
  }
         {
        image(paletteImage, 0, 0, 100, 100);
         }

     if (keyPressed)
     {
       if (key == '1')
       {
        someScale = someScale + .025;
       }
        if (key == '2')
       {
        someRotation = someRotation + .01;
       }
     }
}



