
float someScale;
float someRotation;
color brushColor;
PImage paletteImage;
void setup()
{
  size(400,400);
  paletteImage = requestImage("paletteImage.jpg");
}
void draw()
{
  someRotation = someRotation + 0.1;
  if(paletteImage.width >0)
  {
    image(paletteImage, 0, 0, 100, 100);
  }
  if(mousePressed == true)
  {
    if(mouseButton == RIGHT)
    {
      brushColor = get(mouseX,mouseY);
    }
  }
  if(key == CODED)
  {
    if(keyCode == RIGHT)
    {
      someRotation +=1;
      someScale +=1;
      
    }
    else if (keyCode == LEFT)
    { 
      someRotation -=1;
      someScale -=1;
      
    }
  } 
  someRotation = someRotation + 0.1;
  fill(brushColor);
  pushMatrix();
  translate(width/2, height/2);
  rotate(someRotation);
  translate(mouseX,mouseY);
  strokeWeight(1);
  //stroke(random(255),random(255),random(255));
  
  triangle(0, 0, 20, 0, 0, 20);
  
  popMatrix();
  fill(brushColor);
  
  

  }


