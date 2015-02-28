
float rot=0;

void setup(){
  size(400,400);
  frameRate(60);
  smooth();
  fill(63,127,144);
  stroke(255);
  rectMode(CENTER);
}

void draw(){
  background(0);
  translate(width/2,height/2);
  rotate(rot);
  rect(0,0,200,200);
  rot += 0.06;
}

