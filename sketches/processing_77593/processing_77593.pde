
//Homework Assignment 8
//51257:A
//Copyright 2012 Patrick Clancy pjclancy@andrew.cmu.edu

void setup()
{
  size(400, 400);
  smooth();
}
 
void draw()
{
  createBackground();
  createCircle();
}
 
void createBackground()
{
  if (keyPressed)
  {
    if (key ==' ')
    {
      background(random(5, 255));
    }
  }
  if (mousePressed) 
  { 
    background( 40, 20, 250);
  }
}
 
void createCircle()
{
  strokeWeight(6);
  int x = 0;
  while (x < mouseX )
  {
    ellipse(mouseX, mouseY, x, x);
    x++;
  fill(40, 250, 15);  
  if (keyPressed)
  { 
    if (key == 'n')
    {
    fill( 160, 255, 135 );
    }
}
}
}


//saveframe

