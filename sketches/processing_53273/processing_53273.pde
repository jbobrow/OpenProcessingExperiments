
//Sarah Keeling, 2/21/12
//Assingment 8, using while loops
//copyright 2012
//Jim Robert's Processing for the Arts, CMU

//Click the mouse to change colors
//'b' increases noise and 'p' reduces noise
//'f' increases the speed and 's' slows it down
// 'o' gets rid of the fill in the squares and 'h' gets rid of their stroke.

float x, y, r, thingSpeedX, thingSpeedY;
float noiseScale=0.002;
int myBackgroundColor = #BED6D8;
int myBackgroundColorG = (0);
int myBackgroundColorB = (0);
int myStroke;
int whileStroke;
int whileFill;

void setup () {
  size (400, 400);
  smooth();
  background (#8EAEB4);
  x = random (width);
  y = random(height);
  r = 20;
  thingSpeedX = 2;
  thingSpeedY = 2;

  myStroke = 255;
  whileStroke = 0;
  whileFill = 0;
}

void draw () {
  background (myBackgroundColor);
  pattern2 ();
  drawThing ();
  moveThing ();
  pattern ();
}

void drawThing () {
  ellipse (x, y, r, r);
}

void moveThing ( ) {
  x = x +thingSpeedX;
  y = y +thingSpeedY;

  if (x > width) {
    thingSpeedX = -thingSpeedX;
  }
  else if (x < 0) {
    thingSpeedX = -thingSpeedX;
  }
  if (y > height) {
    thingSpeedY = -thingSpeedY;
  }
  else if  (y< 0) {
    thingSpeedY = -thingSpeedY;
  }
}

void pattern () {
  for (int i=0; i< width; i+= 5) {
    float noiseVal = noise((x+i)*noiseScale, 
    y*noiseScale);
  
    stroke (#8EAEB4);
    line (i, 0, i, noiseVal*400);
    stroke (myStroke);
    line (0, i, x+noiseVal*400, x);
    line (width, i, x+noiseVal*400, y);
    // stroke (0);
    // line (i,0, x,  x+noiseVal*300);
    // stroke (0);
    // line (i, 0, i, x%i);
    // stroke (255,0,0);
    // line (i, height, i, y%i);
  }
}

void pattern2 () {
  fill (whileFill);
  stroke (whileStroke);
  int k = 0;
  int j=0;

  while (k < height) {
    float noiseVal = noise((x+k)*noiseScale, 
    y*noiseScale);
    k+= 10;
    rect (k -5, (height/4)+noiseVal*400, 4, 4);
    rect (k -5, (300)-noiseVal*400, 4, 4);
  }
}

void mousePressed () {
  myStroke = ((int)random (255));
}

void keyPressed () {
  if (key == 'b') {
    noiseScale = noiseScale + 0.01;
  }
  if (key == 'p') {
    noiseScale = noiseScale - 0.01;
  }
  if (key == 'f') {
    thingSpeedX  = thingSpeedX +1;
    thingSpeedY = thingSpeedY +1;
  }

  if (key == 's') {
    thingSpeedX = thingSpeedX - 1;
    thingSpeedY = thingSpeedY - 1;
  }

  if (key == 'o') {
    whileFill  = myBackgroundColor;
  }
  if (key == 'h') {
    whileStroke = myBackgroundColor;
  }
}



 
 
 

