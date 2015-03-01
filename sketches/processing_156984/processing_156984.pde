
float i;

void setup(){
size(500,500);
frameRate(2000);
}
  void draw(){
  background(150);
  translate(width/2, height/2);
  rotate(i);
  resetMatrix();
  stroke(0, 50);
  noFill();
  translate(width/2, height/2);
  rotate(-i/2);
  rectMode(CENTER); 
  fill(0);
  rect(0, 0, 50, 300);
  i = i + 0.01;
}
