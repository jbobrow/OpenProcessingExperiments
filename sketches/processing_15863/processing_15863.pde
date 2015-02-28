
void setup(){
  size(300,300);
  noFill();
  smooth();
  background(255);
}

void draw(){
  noStroke();
  fill(255,255,255,64);
  rectMode(CORNER);
  rect(0,0,width,height);
  
  rectMode(CENTER);
  stroke(random(128,255),random(128,255),random(128,255));
  noFill();
  rect(mouseX,mouseY,random((int)width),(int)random(height));
}

