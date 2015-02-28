
// Hyun Jean Kwon
// © Hyun Jean Kwon Fall 2013, Pittsburgh, PA
// HW7 Course 60257


float x1, y1, sz1, dx1, dy1;
float x2, y2, sz2, dx2, dy2;
color col1, col2;


void setup()
{
  rectMode(CENTER);
  smooth();
  noStroke();
  frameRate(40);
  size(500, 500);
  
  x1 = random(width);
  y1 = random(height);
  sz1 = random( 20, 60);
  dx1 = random( 5, 10);
  dy1 = random( 5, 10);
  
  x2 = random(width);
  y2 = random(height);
  sz2 = random( 20, 60);
  dx2 = random( 5, 10);
  dy2 = random( 5, 10);
}


void draw()
{ prepWindow();

  moveFig1();
  drawFig1();
  
  moveFig2();
  drawFig2();
  
  checkCollision();
}


void prepWindow()
{ fill(10, 80);
  rect(width/2, height/2, width, height);
}


void drawFig1()
{
  fill(10, 50);
  triangle(x1, y1, x1+10, y1-20, x1+20, y1);
}
void moveFig1()
{
  x1 += dx1;
  y1 += dy1;
    if (x1 > width || x1 < 0)
 {
   dx1 = -dx1;
   x1 += dx1;
  }
    else if (y1 > height|| y1 < 0)
  {
    dy1 = -dy1;
    y1 += dy1;
  }}


void drawFig2()
{
  noFill();
  stroke(90, 220, 200);
  strokeWeight(5);
  ellipse(x2, y2, 50, 50);
  strokeWeight(2);
  ellipse(x2, y2, 30, 30);
  ellipse(x2, y2, 20, 20);
  ellipse(x2, y2, 10, 10);
  }
void moveFig2()
{
 x2 += dx2;
 y2 += dy2;
    if (x2 > width || x2 < 0)
 {
   dx2 = -dx2;
   x2 += dx2;
  }
    else if (y2 > height|| y2 < 0)
  {
    dy2 = -dy2;
    y2 += dy2;
  }}
  
  
void checkCollision()
{
//  float colDist = sz1/2 +sz2/2;
//  if (d <+ colDist)
  float d = dist(x1, y1, x2, y2);
  if ( d < (sz1/2 +sz2/2))
  {
    dx1 = dx2;
  noStroke();
  fill( 90, 220, 200);
  rect(width/2, height/2, width, height);
  noFill();
  strokeWeight(10);
  stroke( 255, 0, 166);
  ellipse(width/2, height/2, 500, 500);
  ellipse(width/2, height/2, 450, 450);
  ellipse(width/2, height/2, 400, 400);
  ellipse(width/2, height/2, 350, 350);
  ellipse(width/2, height/2, 300, 300);
  }}
  

void keyPressed()
{
  if (keyCode == RIGHT)
  {dx1++;
  }
  else if (keyCode == LEFT)
  {dx1--;
  }
  else if (keyCode == UP)
  {dy1++;
  }
  else if (keyCode == DOWN)
  {dy1--;
  }
  else if (key == 'a')
  {dx2--;
  }
  else if (key == 'd')
  {dx2++;
  }
  else if (key == 'w')
  {dy2++;
  }
  else if (key == 's')
  {dy2--;
  }
  else if (keyCode == ' ')
  {
    x1 = random(width);
    y1 = random(height);
    x2 = random(width);
    y2 = random(height);
    dx1 = random(5, 10);
    dy1 = random(5, 10);
    dx2 = random(5, 10);
    dy2 = random(5, 10);
  }}


