
float x = 100;
float y = 100;
float w = 60;
float h = 60;
float eyeSize = 16;

float xspeed = 3;
float yspeed = 1;

float eyeR;
float eyeG;
float eyeB;

void setup () {
  size(200,200);
  smooth();
}

void draw(){
  //change location of zoog by speed
  x = x + xspeed;
  y = y + yspeed;
  
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  }
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }
  
  //body
  stroke(0);
  fill(150);
  rect(x,y,w/6,h*2);
  //head
  stroke(0);
  fill(255);
  ellipse(x,y-h/2,w,h);
  //eyes
  eyeR = random(255);
  eyeG = random(255);
  eyeB = random(255);
  fill (eyeR,eyeG,eyeB);
  ellipse (x-w/3,y-h/2,eyeSize,eyeSize*2);
  ellipse (x+w/3,y-h/2,eyeSize,eyeSize*2);
  //Legs
  stroke(150);
  line(x-w/12,y+h,x-w/4,y+h+10);
  line(x+w/12,y+h,x+w/4,y+h+10);
}

