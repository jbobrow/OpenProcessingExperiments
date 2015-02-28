
void setup(){
  size(400,400);
  background(255);
  frameRate(50);
}

void draw(){
  fill(random(255));
  rectMode(CENTER);
  rect(random(400),random(200),random(3),400);
  stroke(255);
  strokeWeight(random(2));
  fill(255);
  rect(random(400),random(150),7,400);
}

