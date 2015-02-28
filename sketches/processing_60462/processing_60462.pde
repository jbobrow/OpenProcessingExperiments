
float r = 0;

void setup() {
  size(500, 500);  
  stroke(255);
  noFill();
  frameRate(18);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  for (int i=0; i<20; i++) {
    rotate(r);
    scale(sin(r));
    ellipse(0, 0, 100, 50);
  }
  r += 0.05f;
}

