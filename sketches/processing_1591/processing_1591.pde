

void setup(){
  background(200);
  size(400, 400);
  smooth();
  frameRate(20);
}

void draw() {
  float diameter = random(600);
  noFill();
  ellipse(200, 200, diameter, diameter);
  ellipse(200, 200, diameter, diameter);
  ellipse(200, 200, diameter, diameter);
  //strokeWeight(0.1);
  stroke(random(255), random(255), random(255));
}

void mousePressed() { 
  background(200);
  redraw();    
}

