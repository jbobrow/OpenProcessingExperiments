
//interactive sketch

void setup(){
  background(255,255,255);
  size(800,400);
  smooth();
}



void draw(){
  strokeWeight(random(20));
  stroke(random(255),random(255),random(255));
  fill(random(255),random(255),random(255));
  ellipse(mouseX,mouseY,50,50);
}

