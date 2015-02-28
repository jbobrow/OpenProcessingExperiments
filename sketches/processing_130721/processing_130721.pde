
color brushColor;
PImage palette;
float  myRotate;
float myScale = 0.5;

void setup()
{
  size (500, 500);
  palette = requestImage("palette.jpg");
}

void draw()

{
  noStroke();
  if (palette.width > 0)
  {
    image(palette, 0, 0, 100,100);
  }
  if (mousePressed == true)
  {
     if (mouseButton == RIGHT)
     {
       brushColor = get(mouseX, mouseY);
       
     }
     else if (mouseButton == LEFT)
       {
  
          pushMatrix();
          translate(mouseX + random(10),mouseY +random(10));
          
          scale(myScale);
          rotate(myRotate);
          
         
          triangle(0, 0, 50, 50, 50, 10);
          popMatrix(); 
       }
      }
  if (keyPressed)
  {
    if (key == 's')
    {
      myScale += .01;
    }
    else if (key == 'r')
      {
        myRotate ++;
         
      }
      if (key == 'd')
      {
         myScale += -.01;
      }
   }
  fill(brushColor);
  
}

  


