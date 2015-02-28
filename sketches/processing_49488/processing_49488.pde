
float zoogX;
float zoogY;

float eyeR;
float eyeG;
float eyeB;

void setup () {
  size (200,200);
  zoogX = width/2; //zoog always starts in the middle
  zoogY = height +100; //zoog starts below the screen
  smooth ();
}

void draw () {
  background (230,98,12);
  
  //set ellipses and rects to CENTER mode
  ellipseMode (CENTER);
  rectMode (CENTER);
  
  //draw zoogs body
  stroke (0);
  fill (255);
  rect (zoogX,zoogY,20,100);
  
  //draw zoogs head
  stroke (0);
  fill (150);
  ellipse (zoogX,zoogY-30,60,60);
  
  //draw zoogs eyes
  eyeR = random(255);
  eyeG = random(255);
  eyeB = random(255);
  fill (eyeR,eyeG,eyeB);
  
  ellipse (zoogX-19, zoogY-30, 16, 32);
  ellipse (zoogX+19, zoogY-30, 16, 32);
  //draw legs
  stroke (150);
  line (zoogX-10, zoogY+50, zoogX-10, height);
  line (zoogX+10, zoogY+50, zoogX+10, height);
  
  //zoog upwards
  zoogY = zoogY-1;
}

