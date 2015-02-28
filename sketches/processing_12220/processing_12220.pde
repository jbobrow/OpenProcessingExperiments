
float x = 100;
float y = 100;
float w = 60;
float h = 60;
float eyeSize = 16;

float eyeR;
float eyeG;
float eyeB;

void setup() {
  size(200,200);
  smooth();
}

void draw(){
  background(255);
  float factor = constrain(mouseX/10,0,5);
  jiggleZoog(factor);
  
  float d = dist(x,y,mouseX,mouseY);
  color c = color(d);
  drawZoog(c);
}

void jiggleZoog(float speed) {
  x = x + random(-1,1)*speed;
  y = y + random(-1,1)*speed;
  x = constrain(x,0,width);
  y = constrain(y,0,height);
}

void drawZoog(color eyeColor) {
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //Looped arms
  for (float i = y+5; i < y + h; i+=10) {
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

