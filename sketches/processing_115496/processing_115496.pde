
PImage paletteImage; 
color currentColor; 
float s = 1;
float r = 0;

void setup()
{
size(500, 500); 
paletteImage = requestImage("palette.jpg"); 
}



void draw()
{


  if (paletteImage.width > 0)
  {
    image(paletteImage, 0, 0, 100, 100); 
  }
  
  if (mouseButton == RIGHT)
  {
    currentColor = get(mouseX, mouseY); 
  }
  
  if (mouseButton == LEFT)
  {
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(r);
  scale(s);
  fill(red(currentColor), green(currentColor), blue(currentColor));
  triangle(30, 75, 58, 20, 86, 75);
  popMatrix(); 
  }

  
  
 if(key == CODED)
 {
   if(keyCode == UP)
   {
      s += 0.01;
   }
   
   if (keyCode == DOWN)
   {
     s += -0.01; 
   }
   if (keyCode == BACKSPACE)
   {
     r = 0; 
   }
   if (keyCode == RIGHT)
   {
     r = r += 1;
   }
   
   if (keyCode == LEFT)
   {
    r = r += -1; 
   }
 }

if (s < 0)
{
  s = 1; 
  
}
}




