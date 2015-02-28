
// 48-257, bumyeolk_HW3
// Bumyeol Kim, Copyright 2012
 
float a, b, c, d;
 
void setup( )
{
  size(400,400);
  fill(#5DD682);
  noStroke();
  smooth();
  a = 255;
  b = 255;
  c = 255;
  d = 10;
}
 
void draw ()
{
  stroke(0, 0, 0);
  line(200, 100, mouseX, mouseY);
  line(200, 300, mouseX, mouseY);
  noStroke( );
  stroke(255, 255, 255);
  line(100, 200, mouseX, mouseY);
  line(300, 200, mouseX, mouseY);
  noStroke( );
  rect(0, 0, 400, 400);
}
 
void mouseMoved ()
{
    noStroke( );
    fill(random(a), random(b), random(c));
    ellipse(mouseX, mouseY, 25, 25);
    rect(mouseX - 15, mouseY -5, 30, 10);
    rect(mouseX - 5, mouseY - 15, 10, 30);
    noFill( );
    fill(#5FE8FF);
    ellipse(random(mouseX + 400), random(mouseY + 400), d, d);
    noFill( );
}

void keyPressed( )
{
  if (key == ' ')
  {
    d = d + 1;
  }
  if (key == 'z')
  {
    d = 10;
  }
}

void mouseClicked ()
{
  if (mouseButton == RIGHT)
  {
    background (random(255));
  }
}
  
void mouseDragged ()
{
  if (mouseButton == RIGHT)
  {
  fill(random(255), random(255), random(255));
  ellipse(random(mouseX + 200), random(mouseY + 200), random(200), random(200));
  } 
  if (mouseButton == LEFT)
  {
  fill(random(255), random(255), random(255));
  triangle(random(mouseX + 150), random(mouseY + 150), random(mouseX + 150), random(mouseY + 150), random(mouseX + 150), random(mouseY + 150));
  }
}

