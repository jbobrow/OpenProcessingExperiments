
int x = 100;
int y = 100;
int w = 60;
int h = 60;
int eyeSize = 16;
int speed = 1;

float eyeR;
float eyeG;
float eyeB;

void setup() {
  size(200,200);
  smooth();
}

void draw() {
  x = x + speed;
  if ((x > width) || (x < 0)) {
    speed = speed * -1;
  }
  background(255);
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //Looped arms
  for (int i = y+5; i < y + h; i+=10) {
    stroke(0);
    line(x-w/3,i,x+w/3,i);
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

