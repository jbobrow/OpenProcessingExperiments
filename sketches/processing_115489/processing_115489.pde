
PImage palette;
color currentColor;
float s = 1;
float r = 0;

void setup()
{
  size(500, 500);
  palette = requestImage("colorWheel.jpg");
}

void draw()
{
  fill(red(currentColor), green(currentColor), blue(currentColor));
  
  if(palette.width > 0)
  {
   image(palette, 0, 0, 150, 110); 
  }
  
  if(mousePressed && (mouseButton == RIGHT))
  {
    currentColor = get(mouseX, mouseY);
  }
  
  if(mousePressed && (mouseButton == LEFT))
  {
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(r);
  scale(s);
  triangle(0, 0, 0, 10, 5, 5);
  popMatrix();  
  }
  
  
  
}

void keyPressed()
{
 if(keyCode == UP)
  {
   s = 1.01*s;
   if(s<0)
   {
    s = -s;
   } 
  }
  
  if(keyCode == DOWN)
  {
   s = s - 0.1;
    if(s<0)
   {
    s = -s;
   } 
  }
  
  if(keyCode == LEFT)
  {
   r -= 0.01; 
  }
 
  if(keyCode == RIGHT)
 {
   r += 0.01;
 } 
}


