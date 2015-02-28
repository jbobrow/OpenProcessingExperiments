
// Oliver Haimson  alhaimso
// Homework 6
// Copyright 2012

// INSTRUCTIONS:
//
// Keys control the movement of the wrapping ellipse only, 
// not the bouncing ellipse.
//
// When the ellipse is moving horizontally, press the right arrow key
// to speed it up, or press the left arrow key to slow it down.
//
// When the ellipse is moving vertically, press the down arrow key
// to speed it up, or press the up arrow key to slow it down.
//
// If you slow the ellipse down enough, it will stop moving.
//
// To change between horizontal and vertical modes, press the "v" or "h" key,
// or press the down arrow while in horizontal mode or the right arrow
// when in vertical mode.
//
// If you press any other key, the location, size, and speed of both ellipses
// resets to a random value.

float x,y,xx,yy,wd,ht,sw,deltaX,deltaY,x2,y2,wd2,ht2,sw2,deltaX2,deltaY2;
float horizMove;
boolean horizontal;

void setup()
{
  size(400,400);
  smooth();
  x = random(400);
  xx = x-width;
  y = random(400);
  yy = y-height;
  wd = random(10,200);
  ht = random(10,200);
  // stroke width is a percentage of the average of the width and height
  sw = (wd+ht)*.5*.02;
  deltaX = random(3);
  deltaY = random(3);
  wd2 = random(10,200);
  ht2 = random(10,200);
  x2 = random(wd2*.5,390-wd2*.5);
  y2 = random(ht2*.5,390-ht2*.5);
  sw2 = (wd2+ht2)*.5*.02;
  deltaX2 = random(3);
  deltaY2 = random(3);
  horizontal = true;
  horizMove = random(3);
}

void draw()
{
  background(39,59,111);
  // first ellipse for wrapping
  initials(x,y,wd,ht,sw);
  // three more ellipses for continual wrap on all sides
  initials(xx,y,wd,ht,sw);
  initials(x,yy,wd,ht,sw);
  initials(xx,yy,wd,ht,sw);
  // ellipse for bouncing
  initials(x2,y2,wd2,ht2,sw2);
  wrapInitials();
  bounceInitials();
  moveHoriz();
}

void bounceInitials()
{
  y2+=deltaY2;
  // the ellipse bounces back up when it gets to the bottom of the screen
  if (y2>height-ht2*.5)
  {
    deltaY2 = -deltaY2;
  }
  // the ellipse bounces back down when it gets to the top of the screen
  if (y2<ht2*.5)
  {
    deltaY2 = -deltaY2;
  }
  // the ellipse bounces left when it gets to the right side of the screen
  if (x2>width-wd2*.5)
  {
    horizMove = -horizMove;
  }
  // the ellipse bounces right when it gets to the left side of the screen
  if (x2<wd2*.5)
  {
    horizMove = -horizMove;
  }
}

// this function makes the bouncing ellipse move back and forth horizontally
void moveHoriz()
{
  x2+=horizMove;
}

void wrapInitials()
{
  // set positions of extra ellipses for continual wrap
  // if second ellipse is to the left of first ellipse 
  if (x>=wd)
  {
    xx=x-width;
  }
  // if second ellipse is to the right of first ellipse 
  if (x<wd) 
  {
    xx=x+width;
  }
  // if second ellipse is above first ellipse 
  if (y>=ht)
  {
    yy=y-height;
  }
  // if second ellipse is below first ellipse 
  if (y<ht) 
  {
    yy=y+height;
  }
  // set up movements for when ellipses are moving horizontally
  if (horizontal == true)
  {
    x+=deltaX;
    // first ellipse goes off the screen to the right
    if (x>(width+wd*.5))
    {
      x=-width+wd*.5;
    }
    // second ellipse goes off the screen to the right
    if (xx>(width+wd*.5))
    {
      xx=-width+wd*.5;
    }
  }
  // set up movements for when ellipses are moving vertically
  if (horizontal == false)
  {
    y+=deltaY;
    // first ellipse goes off the screen to the botton
    if (y>(height+ht*.5))
    {
      y=-height+ht*.5;
    }
    // second ellipse goes off the screen to the bottomv
    if (yy>(height+ht*.5))
    {
      yy=-height+ht*.5;
    }
  }
}

// key controls for the wrapping ellipse
void keyPressed()
{
  // to slow down or speed up horizontally
  if (keyCode == RIGHT && horizontal==true)
  {
    deltaX+=1;
  }
  if (keyCode == LEFT && deltaX>=1 && horizontal==true)
  {
    deltaX-=1;
  }
  // to stop
  if (keyCode == LEFT && deltaX<1 && horizontal==true)
  {
    deltaX=0;
  }
  // to slow down or speed up vertically
  if (keyCode == UP && deltaY>=1 && horizontal==false)
  {
    deltaY-=1;
  }
  if (keyCode == DOWN && horizontal==false)
  {
    deltaY+=1;
  }
  // to stop
  if (keyCode == UP && deltaY<1 && horizontal==false)
  {
    deltaY=0;
  }
  // moves from vertical to horizontal and back
  if (keyCode == RIGHT && horizontal==false)
  {
    horizontal=true;
  }
  if (keyCode == DOWN && horizontal==true)
  {
    horizontal=false;
  }
  if (key == 'v' || key == 'h')
  {
    horizontal = !horizontal;
  }
  // any other key resets location, speed, and ellipse size
  else if (keyCode != UP && keyCode != DOWN && keyCode != LEFT && keyCode != RIGHT
  && key != 'v' && key != 'h')
  {
    x = random(400);
    xx = x-width;
    y = random(400);
     yy = y-height;
    wd = random(10,200);
    ht = random(10,200);
    // stroke width is a percentage of the average of the width and height
    sw = (wd+ht)*.5*.02;
    deltaX = random(3);
    deltaY = random(3);
    wd2 = random(10,200);
    ht2 = random(10,200);
    x2 = random(wd2*.5,390-wd2*.5);
    y2 = random(ht2*.5,390-ht2*.5);
    sw2 = (wd2+ht2)*.5*.02;
    deltaX2 = random(3);
    deltaY2 = random(3);
  }
}

void initials(float ix, float iy, float iwd, float iht, float isw)
{
  fill(28,114,183);
  noStroke();
  ellipse(ix,iy,iwd,iht);

  noFill();
  stroke(193,159,35);
  strokeWeight(isw);
  ellipse(ix,iy,iwd,iht);

  stroke(165,31,27);

  // O

  beginShape();
  curveVertex(ix-.15*iwd, iy-.44*iht);
  curveVertex(ix-.26*iwd, iy-.36*iht);
  curveVertex(ix-.4*iwd, iy-.19*iht);
  curveVertex(ix-.44*iwd, iy);
  curveVertex(ix-.39*iwd, iy+.21*iht);
  curveVertex(ix-.22*iwd, iy+.38*iht);
  curveVertex(ix-.15*iwd, iy+.25*iht);
  curveVertex(ix-.12*iwd, iy);
  curveVertex(ix-.15*iwd, iy-.25*iht);
  curveVertex(ix-.24*iwd, iy-.36*iht);
  curveVertex(ix-.31*iwd, iy-.26*iht);
  curveVertex(ix-.23*iwd, iy-.23*iht);
  curveVertex(ix-.17*iwd, iy-.27*iht);
  curveVertex(ix-.085*iwd, iy-.435*iht);
  curveVertex(ix-.05*iwd, iy-.5*iht);
  endShape();

  // L
  
  beginShape();
  curveVertex(ix-.13*iwd, iy+.5*iht);
  curveVertex(ix-.1*iwd, iy+.435*iht);
  curveVertex(ix+.05*iwd, iy-.15*iht);
  curveVertex(ix-.02*iwd, iy-.445*iht);
  curveVertex(ix-.07*iwd, iy-.15*iht);
  curveVertex(ix+.02*iwd, iy+.44*iht);
  curveVertex(ix+.08*iwd, iy+.5*iht);
  endShape();
  
  // H
  
  beginShape();
  curveVertex(ix, iy+.6*iht);
  curveVertex(ix+.1*iwd, iy+.44*iht);
  curveVertex(ix+.19*iwd, iy);
  curveVertex(ix+.13*iwd, iy-.43*iht);
  curveVertex(ix+.11*iwd, iy-.05*iht);
  curveVertex(ix+.16*iwd, iy+.4*iht);
  curveVertex(ix+.26*iwd, iy);
  curveVertex(ix+.35*iwd, iy+.27*iht);
  curveVertex(ix+.44*iwd, iy+.1*iht);
  curveVertex(ix+.43*iwd, iy-.1*iht);
  curveVertex(ix+.27*iwd, iy-.2*iht);
  endShape();
  
}

