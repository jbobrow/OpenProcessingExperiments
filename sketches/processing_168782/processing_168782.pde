
float x, y;
float dim = 60.0;

void setup() {
  size(440, 250);
  noStroke();
}

void draw() {
  background(102);
  
  x = x + 3;
  
  if (x > width + dim) {
    x = -dim;
  } 
  
  translate(x, height/3-dim/3);
  fill(0,0,255);
  ellipse(-dim/2, -dim/2, dim, dim);
  
 
  translate(x, dim);
  fill(255);
  ellipse(-dim/7, -dim/7, dim, dim);
}  
