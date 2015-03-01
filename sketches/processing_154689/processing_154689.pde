

fullscreen
sketch_140302a.pde
int stepX;
int  stepY;
 
void setup()
{
  size(800,600);
  background(0);
}
 
void draw()
{   
  colorMode(HSB,width,height,100);
  stepX= mouseX+20;
  stepY = mouseY+20;
   
  //for statement
  //gridy and gridx
  for (int gridy=0; gridy<height;gridy+=stepY)
  {
    for (int gridx=0;gridx<width;gridx+=stepX)
    {
      fill(gridx,height-gridy,100);
      ellipse(gridx,gridy,stepX,stepY);
    }
  }
   
}
