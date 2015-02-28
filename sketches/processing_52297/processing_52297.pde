
float angulo = 0.0;

void setup(){
  size(429,420);
  smooth();
  frameRate(15);
  background(0);
  noStroke();
}

void draw(){
  fill (random(255),random(255),random(255),random(0,255));
  translate(random(400),random(400));
  rotate(angulo);
  rect(-30,-30,60,60);
  angulo=angulo+0.1;
}       
