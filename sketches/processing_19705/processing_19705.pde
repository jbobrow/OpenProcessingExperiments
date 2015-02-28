
void setup(){
  size(250, 250);
  smooth();
  background(250);
}

void draw(){
  noFill();
  stroke(0, random(250));
  bezier(125, 125, random(270), random(270), random(270), random(270), 125, 125);
}

