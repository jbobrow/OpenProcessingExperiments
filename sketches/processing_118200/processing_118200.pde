
// Hyun Jean Kwon
// © Hyun Jean Kwon Fall 2013, Pittsburgh, PA
// HW8 Course 60257


float x;
float x1, y1, sz1, dx1, dy1;
float x2, y2, sz2, dx2, dy2;
float x3, y3, sz3, dx3, dy3;
float x4, y4, sz4, dx4, dy4;
float x5, y5, sz5, dx5, dy5;
float x6, y6, sz6, dx6, dy6;
int hits;
int showTime;

void setup()
{
  rectMode(CENTER);
  smooth();
  noStroke();
  frameRate(35);
  size(500, 500);
  
  x = 35;
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
  
  x3 = random(width);
  y3 = random(height);
  sz3 = random( 20, 60);
  dx3 = random( 5, 10);
  dy3 = random( 5, 10);
  
  x4 = random(width);
  y4 = random(height);
  sz4 = random( 20, 60);
  dx4 = random( 5, 10);
  dy4 = random( 5, 10);
  
  x5 = random(width);
  y5 = random(height);
  sz5 = random( 20, 60);
  dx5 = random( 5, 10);
  dy5 = random( 5, 10);
  
  x6 = (250);
  y6 = (250);
  sz6 = random( 20, 60);
  dx6 = random( 5, 10);
  dy6 = random( 5, 10);
}

void draw()
{ prepWindow();

  moveFig1();
  drawFig1();
  
  moveFig2();
  drawFig2();
  
  moveFig3();
  drawFig3();
  
  moveFig4();
  drawFig4();
  
  figure();
  
  moveFig5();
  drawFig5();
  
  moveFig6();
  drawFig6();
  
  showStats();
  showTime();
  
  checkCollision();
  gameover();
}


void prepWindow()
{ fill(10, 80);
  rect(width/2, height/2, width, height);
}


void drawFig1()
{
  noFill();
  stroke(90, 220, 200);
  strokeWeight(5);
  ellipse(x1, y1, 50, 50);
  strokeWeight(2);
  ellipse(x1, y1, 30, 30);
  ellipse(x1, y1, 20, 20);
  ellipse(x1, y1, 10, 10);
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
  
void drawFig3()
{
  noFill();
  stroke(90, 220, 200);
  strokeWeight(5);
  ellipse(x3, y3, 50, 50);
  strokeWeight(2);
  ellipse(x3, y3, 30, 30);
  ellipse(x3, y3, 20, 20);
  ellipse(x3, y3, 10, 10);
}
void moveFig3()
{
  x3 += dx3;
  y3 += dy3;
    if (x3 > width || x3 < 0)
 {
   dx3 = -dx3;
   x3 += dx3;
  }
    else if (y3 > height|| y3 < 0)
  {
    dy3 = -dy3;
    y3 += dy3;
  }}


void drawFig4()
{
  noFill();
  stroke(90, 220, 200);
  strokeWeight(5);
  ellipse(x4, y4, 50, 50);
  strokeWeight(2);
  ellipse(x4, y4, 30, 30);
  ellipse(x4, y4, 20, 20);
  ellipse(x4, y4, 10, 10);
  }
void moveFig4()
{
 x4 += dx4;
 y4 += dy4;
    if (x4 > width || x4 < 0)
 {
   dx4 = -dx4;
   x4 += dx4;
  }
    else if (y4 > height|| y4 < 0)
  {
    dy4 = -dy4;
    y4 += dy4;
  }}
  
void figure()
{
  ellipse(random(0, width), random(0, height), 50, 50);
  ellipse(random(0, width), random(0, height), 50, 50);
  ellipse(random(0, width), random(0, height), 50, 50);
}

void drawFig5()
{
  noFill();
  stroke(random(255), 80);
  strokeWeight(5);
  ellipse(x5, y5, 50, 50);
  strokeWeight(2);
  ellipse(x5, y5, 30, 30);
  ellipse(x5, y5, 20, 20);
  ellipse(x5, y5, 10, 10);
  }
void moveFig5()
{
 x5 += dx5;
 y5 += dy5;
    if (x5 > width || x5 < 0)
 {
   dx5 = -dx5;
   x5 += dx5;
  }
    else if (y5 > height|| y5 < 0)
  {
    dy5 = -dy5;
    y5 += dy5;
  }}
  
void drawFig6()
{
  noFill();
  stroke(random(255), 50);
  strokeWeight(5);
  ellipse(x6, y6, 50, 50);
  strokeWeight(2);
  ellipse(x6, y6, 30, 30);
  ellipse(x6, y6, 20, 20);
  ellipse(x6, y6, 10, 10);
  }
void moveFig6()
{
 if (keyCode == LEFT )
  {x6 = x6 -5;
  }
  else if (keyCode == RIGHT )
  {x6 = x6 +5;
  }
  else if (keyCode == UP )
  {y6 = y6 -5;
  }
  else if (keyCode == DOWN )
  {y6 = y6 +5;
  }}
  
void checkCollision()
{
  float d = dist(x5, y5, x6, y6);
  if ( d <= (sz5/2 + sz6/2)){
  dx5 = dx5;
  dy5 = dy5;
  dx6 = dx6;
  dy6 = dy6;
  dx5 = dx6;
  dy5 = dy6;
    
    hits++; 
}}
    
void keyPressed()
{
  if (key == 'd')
  {frameRate(x++);
  }
  else if (key == 'a')
  {frameRate(x--);
  }
  else if (keyCode == ' ')
  {
    x1 = random(width);
    y1 = random(height);
    dx1 = random(5, 10);
    dy1 = random(5, 10);
    x2 = random(width);
    y2 = random(height);
    dx2 = random(5, 10);
    dy2 = random(5, 10);
    x3 = random(width);
    y3 = random(height);
    dx3 = random(5, 10);
    dy3 = random(5, 10);
    x4 = random(width);
    y4 = random(height);
    dx4 = random(5, 10);
    dy4 = random(5, 10);
  }}

   
void showStats() {
    fill(90, 180, 180);
   text("Number of Hits " + hits, 30, 50);
   }
   
void showTime() {
  fill(90, 180, 180);
  text( "Time " + millis()/1000, 30, 30);
}

void gameover() {
  if ( millis()/1000 > 30) {
  background(10, 100);
  fill(90, 180, 180);
  text( "Score " + hits, 230, 240);
  noFill();
  stroke(90, 220, 200, 30);
  ellipse(random(0, width), random(0, height), 50, 50);
  x5 = 0;
  y5 = 0;
  x6 = 500;
  y6 = 500;
}}
   


