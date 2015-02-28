
// 48-257, bumyeolk_HW7
// Bumyeol Kim, Copyright 2012

float tx, ty, td, txs, tys;
float ax, ay, ad, axs, ays;
float d;
int count;
color col;

void setup()
{
  size(400, 400);
  smooth();
  noStroke();
  background(255);
  txs = 3;
  tys = 3;
  ax = random(width);
  ay = random(height);
  axs = 1;
  ays = 1;
  col = color(255, 255, 255);
}

void draw()
{
  prepWindow();
  target(tx, ty, 50);
  moveTarget();
  aim(ax, ay, 30);
  moveAim();
  collision();
  count();
  time();
}

void target(float tx, float ty, float td)
{
 // background(255, 255, 255);
  fill(random(255), random(255), random(255));
  ellipse(tx, ty, td, td);
  fill(#E1ED45);
  rect(tx, ty, 30, 30);
  rectMode(CENTER);  
  fill(#AA4141);
  ellipse(tx, ty, 15, 15);
}

void moveTarget()
{
  tx = tx + random(txs);
  if (tx > width-td)
  {
    tx = random(width);
    txs = -txs;
  }
  else if (tx < 0+td)
  {
    tx = random(width);
    txs = -txs;
  }
  ty = ty + random(tys);
  if (ty > height-td)
  {
    ty = random(height);
    tys = -tys;
  }
  else if (ty < 0+td)
  {
    ty = random(height);
    tys = -tys;
  }
}

void aim(float ax, float ay, float ad)
{
  fill(0, 0, 0);
  ellipse(ax, ay, ad, ad);
}

void moveAim()
{
  ax = ax + axs;
  if (ax > width)
  {
   ax = 0;
  }
  else if (ax < 0)
  {
    ax = width;
  }
  ay = ay + ays;
  if (ay > height)
  {
    ay = 0;
  }
  else if (ay < 0)
  {
    ay = height;
  }
}

void mouseDragged()
{
  if(mouseX > pmouseX)
  {
    axs = axs + .05;
  }
  else if(mouseX < pmouseX)
  {
    axs = axs - .05;
  }
  if(mouseY > pmouseY)
  {
    ays = ays + .05;
  }
  else if (mouseY < pmouseY)
  {
    ays = ays - .05;
  }
}

void collision()
{
  d = dist(tx, ty, ax, ay);
  if (d < 30)
  {
    col = color(random(255), random(255), random(255)); 
    tx = random(width);
    ty = random(height);
    txs = random(10);
    tys = random(10);
    count ++;
  }
}

void count()
{
  text("Count: " + count , 30, 30);
}

void time()
{
  text("Time: " + millis()/1000, 30, 50);
}

void prepWindow()
{
  fill(col);
  rect(0, 0, 1000, 1000);
}

