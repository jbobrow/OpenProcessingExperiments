
float prevX;
float prevY;
float colorA = 0;
float colorB = 0;
float colorC = 0;
int brush = 0;
float s = 4;
float angle = 0;

 
void setup()
{
  size(700, 700);
  
}
 
void draw()
{
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      if (brush == 0)
      {
        strokeWeight(s);
        stroke(colorA, colorB, colorC);
        line(prevX, prevY, mouseX, mouseY);
      }
      if (brush == 1)
      {
 pushMatrix();
 strokeWeight(s);
 noStroke();
 fill(colorA, colorB, colorC, 175);
  translate(mouseX, mouseY);
  scale(s);
  rotate(radians(angle));
  triangle( random(30), random(40), 0, 0, random(30), random(40));
  popMatrix();
      }
      if (brush == 2)
      {
        fill(colorA, colorB, colorC, 175);
         strokeWeight(random(3));  
        stroke(random(255));
        ellipse(mouseX, mouseY,random(800), random(800));

      }
    }
  }
   
  prevX = mouseX;
  prevY = mouseY;
  
}
 
void keyReleased()
{
  if (key == '1')
  {
    brush = 1;
  }
  if (key == '0')
  {
    brush = 0;
  }
  if (key == '2')
  {
    brush = 2;
  }
  if (key == 'q')
  {
  colorA += 5;
  }
  if (key == 'w')
  {
  colorB += 5;
  }
  if (key == 'e')
  {
  colorC += 5;
  }
   if (key == 'z')
  {
  colorA -= 5;
  }
  if (key == 'x')
  {
  colorB -= 5;
  }
  if (key == 'c')
  {
  colorC -= 5;
  }
  
  if (key == 'o')
  {
  s += 1;
  }
  
  if (key == 'p')
  {
    s -= 1;
  }
  if (key == 'k')
  {
    angle += 10;
  }
  if (key == 'l')
  {
    angle -= 10;
  }
}
 





