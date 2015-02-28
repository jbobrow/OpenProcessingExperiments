
float xPos = 0;
float yPos = 0;

void setup()

{
  size(800, 800);
  background(255);
}

void draw()
{
  xPos=mouseX;
  yPos=mouseY;

  if (mousePressed)
  {
    fill(140, 30, 54);
    ellipse(xPos, yPos, 10, 10);
  }
  else
  {
  if(keyPressed && key == 's')
 { 
  random(0, 255);
  background(random(255), random(255), random(255));
 }
}

 if(keyPressed && key == 's')
 { 
  random(0, 255);
  background(random(255), random(255), random(255));
 }
 
 if(keyPressed && key == 'f')
 {
   random(0, 255);
   fill(random(255), random(255), random(255));
   ellipse(xPos, yPos, 10, 10);
 }
 if(keyPressed &&key; == 'e')
    {fill(0,0,0);
    rect(xPos, yPos, 10, 10);}


}
