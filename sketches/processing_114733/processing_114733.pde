
// Homework #5
// Movement & Collisions
//© Eden Weingart 2013
// eweingart@andrew.cmu.edu


float x1, y1, sz1, dx1, dy1;
float x2, y2, sz2, dx2, dy2;
color col1;
color col2;
PImage pic;
PFont f1;
int hits;
int lastCollisionTime;
float temp = dx1;


void setup ()
{
  rectMode ( CENTER );
  imageMode( CENTER );
  noStroke();
  smooth();
  pic = loadImage("image.png");
  size (400, 400);
  
 
  x1 = random(400);
  y1 = random(400);
  sz1 = 50;
  dx1 = random(8);
  dy1 = random(8);
  col1 = color(200, 255, 100);
  x2 = random(400);
  y2 = random(400);
  sz2 = 50;
  dx2 = random(8);
  dy2 = random(8);
  col2 = color (212, 40, 125);
  
}

void draw ()
{
  prepScreen ();
  movFig1();
  fig1();
  
  movFig2();
  fig2();
  
  
  checkCollision();
}

void showStats()
{
  textFont (f1, 24);
  fill (255, 255, 0);
  text ("Hits:" + hits, width*.7, height*.9);

}

void checkCollision()
{
  float d =dist(x1, y1, x2, y2);
  float colDist = sz1/2 + sz2/2;
  if (d < (colDist))
  {
    x1 -=dx1;
    y1 -=dy1;
    x2 -=dx2*.75;
    y2 -=dy2*.75;
    float temp = dx1;
    dx1=dx2;
    dx2=temp;
    
    temp = dy1;
    dy1 = dy2;
    dy2=temp;
    
    col1 = color(random(255), random(255), random(255));
    noFill();
    stroke(255);
    ellipse (x1, y1, sz1*2.5, sz1*2.5);
    pushMatrix();
    translate (x1, y1);
    rotate (radians(45));
    rect(0, 0, sz1*1.6, sz1*1.6);
    popMatrix();
    noStroke();

  }
  

}

void fig1()
{
  fill (col1);
  ellipse (x1, y1, sz1*1.25, sz1*1.25);
  pushMatrix();
  translate(x1, y1);
  rotate(radians(frameCount));
  fill (0,0,0, 70);
  rect (0, 0, sz1*.7, sz1*.7);
  fill (col1);
  ellipse (0, 0, sz1/3, sz1/3);
  popMatrix();
  

}

void reaction()
{


}


void movFig1()
{
  x1 +=dx1;
  y1 +=dy1;
  if (y1>height+sz1/2)
  {
    y1 =-sz1/2;
    
  
  }
  
  if (y1<0-sz1/2)
  {
    y1 = width+sz1/2;
  
  }
  
  if (x1>width+sz1/2)
  {
    x1 = -sz1/2;
  
  }
  
  if (x1<0-sz1/2)
  {
    x1 = width+sz1/2;
  
  }
  
  

}

void fig2()
{
  fill (255);
  rect (x2, y2, sz2*1.15, sz2*1.15);
  pushMatrix();
    translate(x2, y2);
    rotate (radians(frameCount));
    fill (0,0,0, 70);
    ellipse (0, 0, sz2*.75, sz2*.75);
    fill (255);
    rect (0, 0, sz2/3, sz2/3);
  popMatrix();

}

void movFig2()
{
  x2 +=dx2;
  y2 +=dy2;
  if (x2>width || x2<0)
  {
    dx2 = -dx2;
    x2 += dx2;

  }
  
  if (y2>height || y2<0)
  {
    dy2 = -dy2;
    y2 += dy2;
  
  }
}


void prepScreen () 
{
  fill (0, 0, 0, 10);
  rect (width/2, height/2, width, height);

}

void keyPressed()
{
  if (keyCode == RIGHT) 
  {
    dx1++;
    dx2++;
  }
  
  else if (keyCode == LEFT)
  {
    dx1--;
  }
  
  else if (keyCode == UP) 
  {
    dy1--;
  }
  else if (keyCode == DOWN) 
  {
    dy1++;
  }
  
  else if (key == 'a')
  {
    dx2--;
  }
  
  else if (key == 's')
  {
    dy2++;
  
  }
  
  else if (key == 'd')
  {
    dx2++;
  }
  
  else if (key == 'w')
  {
    dy2--;
  }
  
  
  else if (key == 'r') 
  {
    x1 = random(400);
    y1 = random(400);
    x2 = random(400);
    y2 = random(400);
    dx1 = random(8);
    dy1 = random(8);
    dx2 = random(8);
    dy2 = random(8);
    
  }
  
}



