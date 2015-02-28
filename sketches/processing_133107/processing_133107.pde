
void setup(){
  size(400,400);
  noStroke();
  smooth();
  background(204,220,255);
}

void draw(){
  float x=random(400);
  float y=random(400);
  stroke(x/2,y/2,100);
  strokeWeight(5);
  ellipse(x,y,20,y/2);
  } 

