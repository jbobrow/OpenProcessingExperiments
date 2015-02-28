
void setup(){
  size(250, 250);
  smooth();
  background(0);
}

void draw(){
  stroke(255, random(50));
  noFill();
  bezier(75, 0, random(25, 125), 125, random(25, 125), 125, 75, 250);
  bezier(175, 0, random(125, 225), 125, random(125, 225), 125, 175, 250);
}

// wider, overlap

