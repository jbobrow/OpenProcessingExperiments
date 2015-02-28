
//Colleen Clifford
//Copyright Pittsburgh PA October 2013

float tx, ty, twd, tht, txSpeed, tySpeed;
float cx, cy, cwd, cht, cxSpeed, cySpeed;
PImage t, c;

void setup()
{
  size(600, 600);
  background (228, 255, 167);
  frameRate(30);
  rectMode(CENTER);
  
  tx= random (10, 570);
  ty= random (10, 580);
  cxSpeed= random (5, 8);
  cySpeed= random (5, 8);
  txSpeed= random(5, 8);
  tySpeed= random(5, 8);
  
  t= loadImage("truck.png");
  c=loadImage("car.png");
    
  cwd= width/6;
  cht= height/6;
  twd= width/6;
  tht= height/6;
}

void draw()
{
  prepScreen();
  truck();
  car();
  moveTruck();
  moveCar();
  checkCollision();
  
}

void checkCollision()
{
  float d = dist (tx, ty, cx, cy);
  if (d < twd*.5 + cwd*.5)
  {
    collision();
    txSpeed= -txSpeed;
    tySpeed= -tySpeed;
    cxSpeed= -cxSpeed;
    cySpeed= -cySpeed;
  }
}

void collision()
{
  fill(255, 0, 0);
  noStroke();
  ellipse(cx, cy, width, height);
  fill(0);
  stroke (0);
  textSize(24);
  text ("CRASH!", width/2, height/2);
  
}

void keyPressed()
{
  if (key==CODED)
  {
    if (keyCode == UP) ty += tySpeed*2;
    else if (keyCode == DOWN) ty += tySpeed*2;
    
    if (keyCode == RIGHT) cx += cxSpeed*2;
    if (keyCode == LEFT)  cx -= cySpeed;
  }
}

void moveTruck()
{
  tx+= txSpeed;
  ty+= tySpeed; 
  
  if (tx > width- twd || tx < 0)  
  {
    txSpeed= -txSpeed; 
    tx+= txSpeed;
    ty+= tySpeed;
  }
  if (ty > height- tht || ty < 0)  
  {
  tySpeed= -tySpeed;
  tx+= txSpeed;
  ty+= tySpeed;
  }
}

void moveCar()
{
  cx -= cxSpeed;
  cy -= cySpeed;

  if (cx < -cwd*.5)  cx= width+ cwd*.5;
  else if (cx > width + cwd)   cx = 0;
  else if (cy < -cht*.5)   cy= height + cht*.5;
  else if (cy > height + cht)  cy = 0;
}

void car()
{
  image(c, cx, cy, cwd, cht);
}

void truck()
{
  image(t, tx, ty, twd, tht);
}

void prepScreen()
{
  fill (228, 255, 167, 150);
  rect(width/2, height/2, width, height);
}


