
//copyright Talha Aamir 2014

float x, y;
float wd, ht;
float xdist, ydist;
float easingCoef;

void setup() //done first
{
  size(400, 400); //size is a void function
  noCursor(); //gets rid of cursor
  easingCoef = .02; //easing
}

void draw() //60 times a second
{
 // background(0); //makes background static because draw keeps getting called
 fill(0, 10);
 rectMode(CORNER);
 rect(0, 0, width, height);
  x = mouseX; //anchor point, moves with mouse
  y = mouseY; //anchor point, moves with mouse
  wd = 50;
  ht = 50;
 // wd = width - mouseX;
 // ht = height - mouseY;
  xdist = mouseX-x;
  ydist = mouseY-y;
  x = x + xdist*.5;
  y = y + ydist*.5;
  
  noStroke();
  rectMode(CENTER);
  fill(200, 0, 0);
  rect(x, y, wd, ht);
  fill(0, 200, 0);
  ellipse(x, y, .8*wd, .8*ht);
  strokeWeight(5);
  stroke(255);
  line(x-.5*wd, y-.5*ht, x+.5*wd, y+.5*ht);
}


