
void setup() {
  size(600, 600);
  background(240,250,120);
  smooth();
}

void draw() {
  int distance = int(random(15,50));
  noStroke();
  fill(0);
  ellipse(mouseX+distance, mouseY, 13, 13);
  ellipse(mouseX-distance, mouseY, 13, 13);
  stroke(random(17,185), random(122,230), 7);
  strokeWeight(11);
  noFill();
  arc(mouseX, mouseY, 2*distance, 2*distance, PI,TWO_PI);
  
}

void mousePressed() {
  background(240,250,120);    
}


