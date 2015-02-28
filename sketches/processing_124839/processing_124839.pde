
int counter;

void setup(){
  size(1024,768);
  background(69,100,200);
}

void draw(){
  stroke(100,70,130);
  fill(80,200,30);
  ellipse(512,384,mouseX,mouseY);
  rectMode(CENTER);
  rect(512,384,mouseY,mouseX);
}

