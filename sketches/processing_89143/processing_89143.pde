
// Hao-Yun Mei, hmei
// Copyright_Hao-Yun Mei_Carnegie Mellon University


float Rx,Ry,Rd; //Right
float Lx,Ly,Ld; //Left
float Ux,Uy,Ud; //Up
float Dx,Dy,Dd;// Down
float Ballx, Bally; //Ball
float Ball2x, Ball2y; //Ball2
float v, bv; //Speed

void setup()
{
  size (400,400);
  background(0);
  ellipseMode(CENTER);
  rectMode(CENTER);
  imageMode(CENTER);
  smooth();
  
  Rx= Lx = Ux = Dx = width/2-30;
  Ry= Ly = Uy = Dy = height/2;
  Ballx = Bally = 0;
  Ball2x = width;
  Ball2y = 0;
 
  v= 2;
  bv= 2;
}

void draw()
{
  prepWindow();
  moveStarRight();
  ninjaStar(Rx,Ry);
  moveStarLeft();
  ninjaStar(Lx,Ly);
  moveStarUp();
  ninjaStar(Ux,Uy);
  moveStarDown();
  ninjaStar(Dx,Dy);
  BallSlide();
  Ball(Ballx,Bally);
  BallSlide2();
  Ball(Ball2x,Ball2y);
 // if (keyPressed) saveFrame("hw6.jpg");
  
}


void prepWindow()
{
  fill(0,15);
  rect(width/2,height/2,width,height);
}

void ninjaStar(float x, float y)
{
  noStroke();
  fill(255);
  beginShape();
  vertex(x,y);
  vertex(x+20,y+10);
  vertex(x+30,y+30);
  vertex(x+40,y+10);
  vertex(x+60,y);
  vertex(x+40,y-10);
  vertex(x+30,y-30);
  vertex(x+20,y-10);
  vertex(x,y);
  endShape();  
  fill(0);
  //ellipse(x+30,y,15,15);
  rect(x+30,y,15,15);
}

void moveStarRight()
{
  Rx=Rx+v;
  if(Rx > width-60 || Rx < 0)
  {
    v = -v;
  }
  if(mousePressed)
  {
  v=random (-5,5);
  
  }
}

void moveStarLeft()
{
  Lx=Lx-v;
}

void moveStarUp()
{
 Uy=Uy-v; 
}

void moveStarDown()
{
  Dy=Dy+v;
}

void Ball(float BAx, float BAy)
{
  fill(255,0,0);
  ellipse(BAx,BAy,30,30);
}

void BallSlide()
{
  Ballx=Ballx+bv;
  Bally=Bally+bv;
  if(Ballx > width || Bally > height)
  {
    Ballx = 0;
    Bally = 0;
  }
}

void BallSlide2()
{
  Ball2x=Ball2x-bv;
  Ball2y=Ball2y+bv;
  if(Ball2x < 0 || Bally > height)
  {
    Ball2x = width;
    Ball2y = 0;
    
  }
}

