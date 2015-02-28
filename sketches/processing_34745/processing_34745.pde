

void setup(){
  size(400,400);
  smooth();
  frameRate(60);
  
}

void draw(){
  background(0);
  int speed=abs(mouseX-pmouseX);
  colorMode(HSB,100);
  int h=speed;
  noStroke();
  fill(h,100,100);
  rectMode(CENTER);
  rect(mouseX,200,mouseY/5,50);
  
}

