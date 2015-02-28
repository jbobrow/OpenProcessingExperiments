
//Coded by Mia Rosado :) 

color brushColor;
PImage paletteImage;
float myscale = 1.0; 
float a = 0.0; 

void setup ()
{
 size(800,600); 
 paletteImage = requestImage("palette.jpg");
 background(255,255,255); 
 noStroke();
}

void draw()
{
  
  if (paletteImage.width > 0)
  {
    image(paletteImage, 0, 0, 100, 100);
  }
  if (mousePressed == true)
  { 
    if (mouseButton == RIGHT)
    { brushColor = get(mouseX, mouseY); 
    }
  }
  
 pushMatrix(); 
  if (keyPressed == true)
  {
    if (key == 'm')
    {
      myscale = (myscale + .2);
    }
  }
     if (keyPressed == true)
  {
    if (key == 'n')
    {
      a = (a + .2);
    }
  }     
  if (mousePressed == true && mouseButton == LEFT)
  {
     fill(brushColor); 
     rectMode(CENTER); 
     translate(mouseX-40, mouseY-40);  
     rotate(a);
     scale(myscale);     
    triangle(0, 70, -50, 25, -80, 70);  
  }
  popMatrix();

}

    
    
   
  


