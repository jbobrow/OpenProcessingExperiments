
//Coded by Mia Rosado :)
 
color brushColor;
PImage paletteImage;
float myscale = 1.0;
 
void setup ()
{
 size(800,600);
 paletteImage = requestImage("mr16.jpg");
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

  if (mousePressed == true && mouseButton == LEFT && key != 'o' )
{
     fill(brushColor);
     ellipseMode(CENTER);
     translate(mouseX, mouseY); 
     scale(myscale);    
    ellipse(0, 0, 50, 50); 
  }
  popMatrix();
 
 pushMatrix();
   if (keyPressed == true)
  {
    if (key == 'm')
    {
      myscale = (myscale + .2);
    }
  }
 fill(255, 0, 0);
 {if (mousePressed == true && mouseButton == LEFT && key == 'o')
    {key = 'o';
    
      fill(random(205), random(50), random(205));   
      rectMode(CENTER);
      translate(mouseX, mouseY);   
      scale(myscale);
      rect(0 + random(100), 0 + random(100), 50, 50);
    }
    }
popMatrix(); 

 pushMatrix();
   if (keyPressed == true)
  {
    if (key == 'i')
    {
      filter(INVERT);
    }
  }
  popMatrix();
}



