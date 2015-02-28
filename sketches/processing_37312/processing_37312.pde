
boolean aPressed, ePressed, lPressed;

void setup()
{
  size(800,600);
  background(255,255,255);
  smooth();
  noStroke();
  aPressed = ePressed = lPressed = false;
}

void draw()
{
  if (mousePressed == true) 
{
  noStroke();
  fill (random(20,100),random(20,100),random(20,100));
  ellipse(mouseX,mouseY,random(100),random(100));
}
  if (aPressed)
  {
    background (random(0,255),random(0,255),random(0,255));
  }
  if (ePressed)
  {
    noStroke();
    fill(random(0,50),random(0,50),random(0,50));
    rect(random(0,800),random(0,800),random(0,40),random(0,40));
  }
  if (lPressed)
  {
    stroke(255,255,0);
    fill(random(255),random(255),random(255));
    line(random(0,800),random(0,800),random(0,800),random(0,800));
  }
}

void keyPressed()
{
  if (key == 'a')
  {
    aPressed = true;
  }
  if (key == 'e')
  {
    ePressed = true;
  }
  if (key == 'l')
  {
    lPressed = true;
  }
}

void keyReleased()
{
  if (key == 'a')
  {
    aPressed = false;
  }
  if (key == 'e')
  {
    ePressed = false;
  }
  if (key == 'l')
  {
    lPressed = false;
  }
}




