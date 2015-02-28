
float theta,t;
int d;
float speed=2000;
int dir=1;

void setup() {
  size(600,600);
  background(255);
  strokeWeight(0.01);
  stroke(0);
  fill(100,40);
  d=width-180;
}

void draw() {
  translate(width/2,height/2);
  rotate(t/width*dir);
  rectMode(CENTER);
  rect(0,0,d,d);
  t+=speed*0.075;
  d-=2;
  //dir*=-1;
  
  if(d<10) {
    delay(1000);
    background(255);
    d=width-180;
    fill(random(128,255),random(128,255),random(128,255),40);
    dir*=-1;
  }
}

