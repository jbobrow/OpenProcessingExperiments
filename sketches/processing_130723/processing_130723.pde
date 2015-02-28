
/* @pjs preload="paletteImage.jpg"; */

float brushSize = 0.0;
float scale2 = 1.0;
float rotate2 = 0.0;

PImage palette;
float brushColor;


void setup()
{
  background(#FFFFFF);
size(600,600);
palette = loadImage("palette.jpg");

}



void draw()
{
  if (palette.width > 0)
    {
      image(palette, 0, 0, 100, 100);
    }
  if (mousePressed == true)
    {
      brushColor = get(mouseX, mouseY);
    }
   fill(brushColor);
  
  
  
  
  
  
  if (mousePressed == true)
  {     
        if (mouseButton == LEFT)
          {
            triangle(mouseX,mouseY,mouseX+10, mouseY+10, mouseX+20,mouseY); 
            
          }
          if (keyPressed)
          {
          if (key == '1')
          {
           rotate2 = rotate2+1;
          }
        if (key == '2')
          {
            scale2 = scale2+3;
           }
        if (key == 'r')
          {
           fill(#CD9999); 
           }
        if (key == 'b')
          {
           fill(#9999CD); 
          }
        if (key == 'w')
          {
            fill(#FFFFFF);
          }
         if (key == 'e')
           {
             fill(#000000);
           }
      }
  }
}


