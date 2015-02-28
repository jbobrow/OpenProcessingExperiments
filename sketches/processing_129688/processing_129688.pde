
//Copyrights Mina Kim 2014
//name: Mina Kim, andrew id: minak
//minakim0128@gmail.com
//Homework 3

float x,y,wd,ht;
float xDist,yDist;
float easingCoef;

void setup ()
{
size (400,400);
noStroke ();
easingCoef =.05;
}

void draw ()
{
  wd=100;
  ht=20;
  x=mouseX;
  y=mouseY;
  
  fill(120,10,40,30);
  rectMode (CORNER);
  rect (0,0,400,400);
  noStroke ();
  
  //face
  fill (255,228,196);
  ellipse (x,y,wd*2,ht*10);

  //ears
  fill (255,228,196);
  ellipse (x-wd,y,wd/2,ht*3);
  ellipse (x+wd,y,wd/2,ht*3);

  //eyes
  fill (100);
  ellipse (x-.4*wd,y,wd/6,ht);
  ellipse (x+.4*wd,y,wd/6,ht);

  //mouth
  fill (240,128,128);
  beginShape ();
    curveVertex (x-2*wd,y+4*ht);
    curveVertex (x,y+4.3*ht);
    curveVertex (x+.4*wd,y+3*ht);
    curveVertex (x,y+3.2*ht);
    curveVertex (x-.4*wd,y+3*ht);
    curveVertex (x,y+4.3*ht);
    curveVertex (x+2*wd,y+4*ht);
  endShape ();

  //hair
  fill (100);
  ellipse (x,y-4*ht,wd*1.3,2.5*ht);

  //glasses
  noFill ();
  stroke (0,128,128);
  strokeWeight (3);  
  rect (x-.6*wd,y,wd/2.5,ht);
  rect (x+.2*wd,y,wd/2.5,ht);

  fill (0,128,128);
  noStroke ();
  rect (x-.2*wd,y+.5*ht,wd/2.5,ht/5);

  //initial m as mustache
  fill (245,255,250);
  beginShape ();
    curveVertex (x,y);
    curveVertex (x+.5*wd,y+3*ht);
    curveVertex (x+.25*wd,y+1.5*ht);
    curveVertex (x,y+1.9*ht);
    curveVertex (x-.25*wd,y+1.5*ht);
    curveVertex (x-.5*wd,y+3*ht);
    curveVertex (x-.25*wd,y+2.3*ht);
    curveVertex (x,y+2.8*ht);
    curveVertex (x+.25*wd,y+2.3*ht);
    curveVertex (x+.5*wd,y+3*ht);
    curveVertex (x,y);
  endShape ();
}






