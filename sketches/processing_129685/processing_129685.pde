
//Copyrights Mina Kim 2014
//name: Mina Kim, andrew id: minak
//minakim0128@gmail.com

//10% bonus for ease in

float x,y;
float wd,ht;
float xDist,yDist;
float easingCoef;

void setup ()
{
  size (400,400);
  noCursor ();
  easingCoef=.2;
  wd=40;
  ht=40;
}

void draw ()
{
  fill(0,10);
  rectMode (CORNER);
  rect (0,0,width,height);
  noStroke ();
  wd=40;
  ht=40;
  
  fill(255);
  strokeWeight (2);
  stroke (100);
  ellipse (mouseX,mouseY,wd,ht);
  
  
}


