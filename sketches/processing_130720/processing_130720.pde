
PImage paletteImage;
color brushColor;
float myScale= 0.0;
float myRotation= 0.0;
float rad = 0.0;

void setup()
{
 size(500,500);
 background(255);
 paletteImage= requestImage("palette.jpg");
 frameRate(30);
}

void draw()
{
  image(paletteImage,0,0,150,150);
  rad= rad+ .01;
  noStroke();
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      fill(0);
      triangle(mouseX,mouseY,mouseX-20,mouseY-20,mouseX+20,mouseY-20);
    }
    else if (mouseButton == RIGHT)
    {
      brushColor= get(mouseX,mouseY);
      triangle(mouseX,mouseY,mouseX-20,mouseY-20,mouseX+20,mouseY-20);
    }
    if (keyPressed)
    {
      if (keyCode == UP)
      {
        pushMatrix();
        translate(mouseX,mouseY);
        rotate(rad);
        popMatrix();
      }
        
      else if (keyCode == DOWN)
      {
        pushMatrix();
        translate(mouseX,mouseY);
        rotate(rad);
        popMatrix();
      }
    }
  }
  fill(brushColor);
}


