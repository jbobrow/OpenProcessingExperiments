
// thomas bertling
// www.thomasworks.com

import processing.pdf.*;

int bagw = 100; // width
int bagh = 150; // height
int margin = 20; // margin
int bacross = 4;
int bdown = 3;

void setup()
{
  size(bagw*bacross+margin*(bacross+1), bagh*bdown+margin*(bdown+1));
  smooth();
  noLoop();
  beginRecord(PDF, "filename.pdf");
}


//////////////////////////////////////////////////////////////////////////
//duplication of bag varitiations
void draw()
{
  background(200);
  for ( int moveX = margin; moveX < width ; moveX += bagw+margin)
  {
    for ( int moveY = margin; moveY < height; moveY += bagh+margin)
    {
      drawbag(moveX, moveY);
    }
  }
  endRecord();
}

//////////////////////////////////////////////////////////////////////////
//bag elements: base, cutlines, topflap

void drawbag(float x, float y)
{  
  noFill();

  float thisw = random(50, bagw);
  float thish = random(30, bagh);

  color [] colors = new color [4];
  colors[0] = color(22, 145, 242);
  colors[1] = color(7, 53, 90);
  colors[2] = color(252, 216, 8);
  colors[3] = color(40, 40, 49);


  //bag outline
  int rand = int(random(4));
  fill(colors[rand]);
  bezierRect(x, y, bagw, bagh, random(-10, 10), random(-10, 10));


  // cutline
  float startheight = random (-10, 10);
  float endwidth = random(0, 30);
  float middleX = random (0, 20);
  float middleY = random (-10, 10);


  noFill();
  beginShape();
  curveVertex(x, y+40+startheight);
  curveVertex(x, y+40+startheight);
  curveVertex(x+30-middleX, y+55+middleY);
  curveVertex(x+35-endwidth, y+150);
  curveVertex(x+35-endwidth, y+180);
  endShape();

  noFill();
  beginShape();
  curveVertex(x+bagw-0, y+40+startheight);
  curveVertex(x+bagw-0, y+40+startheight);
  curveVertex(x+bagw-30+middleX, y+55+middleY);
  curveVertex(x+bagw-35+endwidth, y+150);
  curveVertex(x+bagw-35+endwidth, y+180);
  endShape();


  //bag pocket
  float offsetxA = (bagw-thisw)/2;
  float offsetyA = random(10, bagh-thish-10);
  //  fill(55);
  int rand2 = int(random(4));
  fill(colors[rand2]);
  bezierRect(x+offsetxA, y+offsetyA, thisw, thish, random(-10, 10), random(-10, 10));

  //bag flap
  float offsetxB = (bagw-thisw)/2;
  float offsetyB = random(0, bagh-thish);
  float thishB = random(20, 50);
  // fill(60);
  int rand3 = int(random(4));
  fill(colors[rand3]);
  bezierRect(x, y-3, bagw, thishB, random(-10, 10), random(-10, 10));
}



//////////////////////////////////////////////////////////////////////////
//function for bezier rectangle
/**
 @param x  x-coordinate of upper-left
 @param y  y-coordinate of upper-left
 @param w  width of the rectangle
 @param h  height of the rectangle
 @param xr radius to inset x-coordinate corners for bezier controls (may be negative to "outset")
 @param yr radius to inset y-coordinate corners for bezier controls (may be negative to "outset")
 */
void bezierRect(float x, float y, float w, float h, float xr, float yr) {
  float w2=w/2f, h2=h/2f, cx=x+w2, cy=y+h2;
  beginShape();
  vertex(cx, cy-h2);
  bezierVertex(cx+w2-xr, cy-h2, cx+w2, cy-h2+yr, cx+w2, cy);
  bezierVertex(cx+w2, cy+h2-yr, cx+w2-xr, cy+h2, cx, cy+h2);
  bezierVertex(cx-w2+xr, cy+h2, cx-w2, cy+h2-yr, cx-w2, cy);
  bezierVertex(cx-w2, cy-h2+yr, cx-w2+xr, cy-h2, cx, cy-h2);
  endShape();
}


