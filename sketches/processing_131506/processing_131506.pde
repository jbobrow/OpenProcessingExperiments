
PImage paletteImage;
color brushColor;
float someScale = 1.0;
float someRotation = 1.0;  
  
void setup()
{
  size(500, 500);
  background(255);
  paletteImage = requestImage("colorwheel.jpg");
}
 
void draw()
{
  noStroke();
  fill (200, 255, 0);
  {
  image(paletteImage, 0, 0, 100, 100);
  }
    if (mousePressed == true)
  {
    if (mouseButton ==LEFT)
    {
      pushMatrix(); 
      translate(mouseX, mouseY);
      rotate(someRotation); 
      scale(someScale);
      fill(brushColor);
      triangle(30, 70, 50, 30, 80, 70);
      popMatrix();
    }
    if (mouseButton == RIGHT)
     {
     brushColor= get(mouseX, mouseY);
     }   
  }                
     if (keyPressed)
     {
       if (key == '1')
       {
       someScale = someScale + .1;
       }
        if (key == '2')
         {
         someRotation = someRotation + .1;
         }
         if (key == '3')
          {
          someScale = someScale - .1;
          }         
     }
}



