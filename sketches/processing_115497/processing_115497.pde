
PImage paletteImage;
color currentColor;
float x1 = 50;
float y1 = 50;
float x2 = 50;
float y2 = 50;
float r = 0;
float s = 1.0;


void setup()
{
 size(500,500);
 paletteImage = requestImage("palette.jpg");
     background(255);
}

void draw()

{

  if (paletteImage.width > 0)
  {
    image(paletteImage,0,0,100,80);
  }
  
  if (mousePressed == true && mouseButton == RIGHT)
  {
    background(255);
  }
  
  if (mousePressed == true && mouseButton == LEFT)
{  
  if (overRect(0,0,100,80) == true)
  {
      currentColor = get(mouseX, mouseY);
  }
  else
  {
    stroke(0);
    strokeWeight(1.5);  
    fill(red(currentColor), green(currentColor), blue(currentColor));
  pushMatrix(); 
  translate(mouseX, mouseY);
  rotate(r);
  scale(s);
  triangle(0, 0, - x1, y1, - x2, - y2);
  popMatrix();
  }
}
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == RIGHT)
  {
    r = r + radians(3);
  }
  
  if (keyCode == LEFT)
  {
    r = r - radians(3);
  }
  
  if (keyCode == UP)
    {
      s = s + .02;
    }
    
   if (keyCode == DOWN)
    {
      s = s - .02;
    } 
  }
}

void keyRelesed()
{
  
  
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}





