
// Ryanne Hollies 
// PS2-4 

// overlapping squares

void setup() {
  size(400, 400);
  smooth();
}

//-------------------------------------------

void draw() {
  background(255);
  rectMode(CENTER);
  
  if(overlap(mouseX, mouseY, 200, 200, 100, 100, 100, 100)) {
  fill(0, 200, 240);
  stroke(5);
  }
  else {
  noFill();
  stroke(5);
  }
}

//------------------------------------------

boolean overlap(float x, float y, float x2, float y2, float w, float h, float w2, float h2) {
  rect(x, y, w, h);
  rect(x2, y2, w2, h2);
  
   float dx = dist(x, 0, x2, 0);
  float dy = dist(y, 0, y2, 0);
  
  if(dx < (w/2 + w2/2) && dy < (h/2 + h2/2) ) return false;
  else return true;
}

