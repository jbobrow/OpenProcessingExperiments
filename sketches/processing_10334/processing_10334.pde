
float A = 0;
float centerX = 215;
float centerY = 160;
float radius = 150; //radius of spinning ball
float ballsize = 5;
float speed = 2;
int card = 0;
PImage Start;
PImage End;

void setup() {
  size(480, 320);
  smooth();
  Start= loadImage("Start.jpg");
  End= loadImage("End.jpg");
}

void draw() {
  background(255);
  
  
  if (card == 0) {
    background(0);

    image (Start,0,0);
    if (mousePressed) {
      card = 1;
 
    }  
  } 
  
  else if (card == 2) {
    // dead screen
    background(0);

    image (End,0,0);
    if (mousePressed) {
      card = 1;
      
 
    }  
  } 
  
  
  
  else if (card == 1) {

  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
    
  //--------
  float x= cos(A)*radius + centerX;
  float y= sin(A)*radius + centerY;
  ellipse (x,y,ballsize,ballsize); //ball size
  A+= radians(speed); //speed of spinning ball
  
  fill(0);
  rect(mouseX - 20, 160, 30, ballsize/2); //rectangular bar
  
  if(rectCircleIntersect(mouseX - 20, 160, 30, ballsize/2,x,y,ballsize/2)) {
    
    // you died
    speed = 2;
    ballsize = 5;
    card = 2;
  }
  
  if (frameCount % 400 == 0) {
    speed++;
    ballsize += 5;
  }
  // -----------
  }
}


boolean rectCircleIntersect(float rx, float ry, float rw, float rh, float cx, float cy, float cr) {
 
  float circleDistanceX = abs(cx - rx - rw/2);
  float circleDistanceY = abs(cy - ry - rh/2);
 
  if (circleDistanceX > (rw/2 + cr)) { return false; }
  if (circleDistanceY > (rh/2 + cr)) { return false; }
  if (circleDistanceX <= rw/2) { return true; }
  if (circleDistanceY <= rh/2) { return true; }
 
  float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2);
  return cornerDistance <= pow(cr, 2);
}


