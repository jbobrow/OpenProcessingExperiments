
//homework 5
//Matt Dawson
//madawsonandrew.cmu.edu
//copyright © Matt Dawson September 2012 Pittsburgh PA 15213 All Rights Reserved

//press enter to reset speeds and locations


float x,y,d;
float ix,iy,ixspeed,iyspeed;
float ix2, iy2, ixspeed2, iyspeed2;
color c1,c2,c3,c4,c11,c22,c33;

void setup()
{
  size (500,500);
  smooth();
  ix = random(width);
  iy = random(height);
  ixspeed = random(0,10);
  iyspeed = random(0,10);
  
  ix2 = random(width);
  iy2 = random(height);
  ixspeed2 = random(0,10);
  iyspeed2 = random(0,10);
  
  c1=color(255,21,36);
  c2=color(4,203,49);
  c3=color(248,252,130);
  c4=color(4,15,203);
  c11= color(4,203,49);
  c22= color(248,252,130);
  c33= color(255,21,36);
  
  x=100;
  y=100;
  d=100;
}

void draw()
{
  prepWindow( );
  moveInt( );
  drawInt( ix, iy );
  drawInt2( ix2, iy2 );
  moveInt2( );
}

void moveInt( )
{
  ix = ix + ixspeed;
  if (ix > width)
  {
    ixspeed = ixspeed*-1;
  }
  else if (ix < 0)
  {
    ixspeed = ixspeed*-1;
  }
  
  iy = iy + iyspeed;
  if (iy > height)
  {
    iyspeed = -iyspeed;
  }
  else if (iy < 0)
  {
    iyspeed = -iyspeed;
  }
}

void drawInt(float x, float y)
{
  ellipseMode(CENTER);
stroke(c4);
strokeWeight(2);
ellipse(x,y,d,d);

//Initial(M)
strokeWeight(2);
stroke(0,0,0);
fill(c1);

beginShape();
curveVertex(x,y+(d/2));
curveVertex(x,y);
curveVertex(x-(d/3),y-(d/3));
curveVertex(x-(d/2),y);
curveVertex(x-(d/3),y+(d/3));
curveVertex(x-(.45*d),y);
curveVertex(x-(d/3),y-(d/4));
curveVertex(x-(d/4),y-(d/5));
curveVertex(x,y);
endShape(CLOSE);

beginShape();
curveVertex(x,y+(d/2));
curveVertex(x,y);
curveVertex(x+(d/3),y-(d/3));
curveVertex(x+(d/2),y);
curveVertex(x+(d/3),y+(d/3));
curveVertex(x+(.45*d),y);
curveVertex(x+(d/3),y-(d/4));
curveVertex(x+(d/4),y-(d/5));
curveVertex(x,y);
endShape(CLOSE);

//Initial(A)
fill(c2);
beginShape();
curveVertex(x,y+(d/2));
curveVertex(x-(d/3),y+(d/3));
curveVertex(x-(.45*d),y);
curveVertex(x-(d/3),y-(d/4));
curveVertex(x-(d/10),y);
curveVertex(x-(d/8),y+(d/3));
curveVertex(x-(d/4),y+(d/10));
curveVertex(x-(d/3),y+(d/3));
curveVertex(x-(d/3),y+(d/3));
endShape(CLOSE);

//Center initial(A)
fill(255);
beginShape();
curveVertex(x-(.45*d),y);
curveVertex(x-(.4*d),y);
curveVertex(x-(d/3),y-(d/5));
curveVertex(x-(d/6),y);
curveVertex(x-(d/3.5),y-(d/12));
curveVertex(x-(.4*d),y);
endShape(CLOSE);

//Initial (D)
fill(c3);
beginShape();
curveVertex(x,y+(d/2));
curveVertex(x+(d/3),y+(d/3));
curveVertex(x+(.45*d),y);
curveVertex(x+(d/3),y-(d/4));
curveVertex(x+(d/10),y);
curveVertex(x+(d/8),y+(d/3));
curveVertex(x+(d/3),y+(d/3));
endShape(CLOSE);

//Center Initial (D)
fill(255);
beginShape();
curveVertex(x+(d/8),y+(d/3));
curveVertex(x+(d/4),y+(d/4));
curveVertex(x+(.38*d),y);
curveVertex(x+(d/3.5),y-(d/10));
curveVertex(x+(d/5),y+(d/4));
curveVertex(x+(d/8),y+(d/3));

endShape(CLOSE);
}

void prepWindow( )
{
  fill(255,10);
  rect(0,0,width,height);
}

//WRAPPING
void moveInt2( )
{
  ix2 = ix2 + ixspeed2;
  if (ix2 > width + 100)
  {
    ix2 = 0;
  }

  iy2 = iy2 + iyspeed2;
  if (iy2 > height + 100)
  {
    iy2 = 0;
  }
}

void drawInt2(float x, float y)
{
  ellipseMode(CENTER);
stroke(c4);
strokeWeight(2);
ellipse(x,y,d,d);

//Initial(M)
strokeWeight(2);
stroke(0,0,0);
fill(c1);

beginShape();
curveVertex(x,y+(d/2));
curveVertex(x,y);
curveVertex(x-(d/3),y-(d/3));
curveVertex(x-(d/2),y);
curveVertex(x-(d/3),y+(d/3));
curveVertex(x-(.45*d),y);
curveVertex(x-(d/3),y-(d/4));
curveVertex(x-(d/4),y-(d/5));
curveVertex(x,y);
endShape(CLOSE);

beginShape();
curveVertex(x,y+(d/2));
curveVertex(x,y);
curveVertex(x+(d/3),y-(d/3));
curveVertex(x+(d/2),y);
curveVertex(x+(d/3),y+(d/3));
curveVertex(x+(.45*d),y);
curveVertex(x+(d/3),y-(d/4));
curveVertex(x+(d/4),y-(d/5));
curveVertex(x,y);
endShape(CLOSE);

//Initial(A)
fill(c2);
beginShape();
curveVertex(x,y+(d/2));
curveVertex(x-(d/3),y+(d/3));
curveVertex(x-(.45*d),y);
curveVertex(x-(d/3),y-(d/4));
curveVertex(x-(d/10),y);
curveVertex(x-(d/8),y+(d/3));
curveVertex(x-(d/4),y+(d/10));
curveVertex(x-(d/3),y+(d/3));
curveVertex(x-(d/3),y+(d/3));
endShape(CLOSE);

//Center initial(A)
fill(255);
beginShape();
curveVertex(x-(.45*d),y);
curveVertex(x-(.4*d),y);
curveVertex(x-(d/3),y-(d/5));
curveVertex(x-(d/6),y);
curveVertex(x-(d/3.5),y-(d/12));
curveVertex(x-(.4*d),y);
endShape(CLOSE);

//Initial (D)
fill(c3);
beginShape();
curveVertex(x,y+(d/2));
curveVertex(x+(d/3),y+(d/3));
curveVertex(x+(.45*d),y);
curveVertex(x+(d/3),y-(d/4));
curveVertex(x+(d/10),y);
curveVertex(x+(d/8),y+(d/3));
curveVertex(x+(d/3),y+(d/3));
endShape(CLOSE);

//Center Initial (D)
fill(255);
beginShape();
curveVertex(x+(d/8),y+(d/3));
curveVertex(x+(d/4),y+(d/4));
curveVertex(x+(.38*d),y);
curveVertex(x+(d/3.5),y-(d/10));
curveVertex(x+(d/5),y+(d/4));
curveVertex(x+(d/8),y+(d/3));

endShape(CLOSE);
}
void keyPressed()
{
if (keyCode == ENTER)
  {
     ix = random(width);
  iy = random(height);
  ixspeed = random(0,10);
  iyspeed = random(0,10);
  
  ix2 = random(width);
  iy2 = random(height);
  ixspeed2 = random(0,10);
  iyspeed2 = random(0,10);
  }
}

