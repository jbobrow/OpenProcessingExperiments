
//abby frankola
//afrankol
//copyright 2013


float x1, y1, sz1, dx1, dy1;
float x2, y2, sz2, dx2, dy2;
color col1, col2;
int count;
int  startTime, endTime,  gameTime; 
PImage ast, bg1, planet;

void setup()
{
  rectMode(CENTER);
  imageMode (CENTER);
  smooth();
  noStroke();
  frameRate(40);
  size(400, 400);
  
  count = 0; 
  startTime = 0; 
  endTime=0;
  gameTime= 100000;
 
   
  x1 = random(width);
  y1 = random(height);
  sz1 = random( 30, 50);
  dx1 = random( 5, 10);
  dy1 = random( 5, 10);
   
  x2 = random(width);
  y2 = random(height);
  sz2 = random( 40, 60);
  dx2 = random( 5, 10);
  dy2 = random( 5, 10);
  
  ast= loadImage("hw8ast.gif");
  planet= loadImage("hw8earth.gif");
  bg1= loadImage("hw8.png");
}
 
 
void draw()
{ prepScreen();
 
  moveAst1();
  drawAst1();
   
  movePla1();
  drawPla1();
   
  checkCollision();
}
 
 
void checkTime()
{
  fill(255);
  text("Time Remaining: " + (gameTime/1000- ((millis()- startTime))/1000), width/2, 50 );
 
} 


void prepScreen ()
{
  image(bg1, width/2, height/2, width, height);
} 
 
 
void drawAst1()
{
  pushMatrix();
  translate(x1, y1);
  image (ast, 0, 0, sz1, sz1);
  popMatrix ();
}
void moveAst1()
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
 
 
void drawPla1()
{
  pushMatrix();
  translate(x2, y2);
  image (planet, 0, 0, sz2, sz2);
  popMatrix ();
  }
void movePla1()
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
// ss float colDist = sz1/2 +sz2/2;
//  if (d <+ colDist)
  float d = dist(x1, y1, x2, y2);
  if ( d < (sz1/2 +sz2/2))
  {
    dx1 = dx2;
  noStroke();
  
  fill( 253, 247,98);
  rect(width/2, height/2, width, height);
  fill(240,115,2);
  ellipse(width/2, height/2, 350, 350);
  fill(181,7,7);
  ellipse(width/2, height/2, 200, 200);
  fill(0);
  textSize(50);
  textAlign(CENTER);
  text("BOOM", width/2, height/2);

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



