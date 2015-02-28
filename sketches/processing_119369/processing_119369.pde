
//Shanna Chan Pittsburgh, PA 
//fall 2013 
//hw 7 

float x1, y1, sz1, dx1, dy1;
float x2, y2, sz2, dx2, dy2;
color col1, col2;
 
 
void setup()
{
  size(600, 600);
   
  x1 = random(width);
  y1 = random(height);
  sz1 = random( 20, 60);
  dx1 = random( 1, 5);
  dy1 = random( 1, 5);
   
  x2 = random(width);
  y2 = random(height);
  sz2 = random( 20, 60);
  dx2 = random( 1, 5);
  dy2 = random( 1, 5);
}
 
 
void draw()
{ setting();
 
  moveShip();
  drawShip();
   
  movePlant();
  drawPlant();
   
  checkCollision();
}
 
 
void setting()
{ noStroke();
  fill( 12, 14, 49, 80);
  rect(0, 0, width, height);
}
 
 
void drawShip()
{
  fill(255);
  noStroke();
  triangle(x1, y1, x1+10, y1-20, x1+20, y1);
  triangle(x1, y1, x1, y1+20, x1+20, y1);
  triangle(x1, y1, x1+20, y1+20, x1+20, y1);
  fill (255,0,4);
  arc(x1+10, y1+40, 25, 25, PI, TWO_PI);
  fill (255,230,3);
  arc(x1+10, y1+40, 15, 15, PI, TWO_PI);
}
void moveShip()
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
 
 
void drawPlant()
{
  noFill();
  stroke(255,0,4,30);
  strokeWeight(1);
  ellipse(x2, y2, 80, 80);
  ellipse(x2, y2, 65, 65);
   stroke(255,0,4,60);
   ellipse(x2, y2, 50, 50);
  strokeWeight(2);
  ellipse(x2, y2, 40, 40);
  stroke(255,0,4);
  ellipse(x2, y2, 30, 30);
  strokeWeight(3);
  ellipse(x2, y2, 20, 20);
  fill(255,0,4);
  ellipse(x2, y2, 10, 10);
  }
void movePlant()
{
 x2 += dx2;
 y2 += dy2;
     if (x2 > width)
 {
   x2 = 0;
  }
    else if (y2 > height)
  {
    y2 = 0;
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
  fill(0,50);
  rect(0, 0, width, height);
  noFill();
  strokeWeight(1);
  stroke( 255, 0, 4);
  ellipse(width/2, height/2, 550, 550);
  ellipse(width/2, height/2, 450, 450);
   strokeWeight(2);
  ellipse(width/2, height/2, 400, 400);
   strokeWeight(5);
  ellipse(width/2, height/2, 350, 350);
   strokeWeight(10);
  ellipse(width/2, height/2, 300, 300);
  strokeWeight(15);
  ellipse(width/2, height/2, 250, 250);
  fill ( 255, 0, 4);
  ellipse(width/2, height/2, 200, 200);
  textSize(50);
   fill(255);
   textAlign(CENTER, CENTER);
   text("LANDED!", width*0.5, height*0.5);
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
  else if (key == 'l')
  {dx2--;
  }
  else if (key == 'r')
  {dx2++;
  }
  else if (key == 'u')
  {dy2++;
  }
  else if (key == 'd')
  {dy2--;
  }
  else if (keyCode == ' ')
  {
    x1 = random(width);
    y1 = random(height);
    x2 = random(width);
    y2 = random(height);
    dx1 = random(1, 5);
    dy1 = random(1, 5);
    dx2 = random(1, 5);
    dy2 = random(1, 5);
  }}



