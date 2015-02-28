
//homework 7
//copyright 2012 kathryn thomas

float bx, by, bdia, bxSpeed, bySpeed;
float wx, wy, wdia, wxSpeed, wySpeed;
float colR,colG,colB;

void setup ()
{
  smooth ();
  background (0, 0, 0);
  size (400, 400); 
  bx=random(width);
  by= random(height);
  bdia= 10;
  bxSpeed=4;
  bySpeed=5;
  
  wx=random(width);
  wy= random(height);
  wdia= 20;
  wxSpeed=4;
  wySpeed=5;


}

void draw ()
{
 background (colR, colG, colB);
 bounceTarget();
 wrapTarget();
 collision();
}

void wrapTarget ()
{
  wx=wx+wxSpeed;
  if (wx > width - wdia/2 || wx < + wdia/2) {
    wx = wx - (0.95*width);
  }

  wy=wy+wySpeed;
  if (wy > height - wdia/2 || wy < + wdia/2) {
    wy = wy - (0.95*height);
  }
  strokeWeight (5);
  stroke (255, 0, 0);
  fill (random(255),random(255),random(255));
  drawTarget (wx, wy, wdia);

}

void bounceTarget ()
{
  bx=bxSpeed+bx;
  if(bx > width - bdia/2 || bx < + bdia/2) {
   bxSpeed = -bxSpeed; 
  }
  
  by=bySpeed+by;
  if(by > height - bdia/2 || by < + bdia/2) {
  bySpeed = -bySpeed;
  }
  strokeWeight (5);
  stroke (255, 0, 0);
  fill (255, 255, 255);
  drawTarget (bx, by, bdia);

}


void drawTarget (float x, float y, float dia)
{
  fill(255, 255, 255);
  stroke(255, 0, 0);
  strokeWeight(10);
  ellipse(x, y, dia, dia);
}

void collision()
{
 if(abs(bx-wx) < wdia/2 && abs(by-wy) < wdia/2)
  {
  colR=255;
  colG=205;
  colB=51;
  } 
  else
  {
  colR=0;
  colG=157;
  colB=217;
  }
}


