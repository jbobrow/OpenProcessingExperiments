
float x, y;
float dim = 80.0;

void setup() {
  size(465, 275);
  noStroke();
}

void draw() {
  background(#7BB661);
  
  x = x + 1;
  
  if (x > width + 2) {
    x = -2;
  } 
  
  translate(x, height/1.15-dim/1.15);
  fill(255);
  ellipse(-dim/1.15, -dim/1.15, dim, dim);
}


