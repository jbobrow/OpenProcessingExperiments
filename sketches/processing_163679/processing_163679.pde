
void setup() {
  size(500,500);
  background(50);
  noLoop();
}

void draw() {
  arch(40.0);
}

void arch(float curvature) {  
  float y = 450.0;
  fill(curvature*2,193,92,120);
  stroke(72,212,239,200);
  strokeWeight(curvature/10);
  point(75.0, y-curvature);
  point(150.0,275.0);
  point(350.0,275.0);
  point(425.0, y-curvature);
  beginShape();
  vertex(75.0,y);
  bezierVertex(75.0, y-curvature, 150.0, 275.0, 250.0, 275.0);
  bezierVertex(350.0, 275.0, 425.0, y-curvature, 425.0, y);
  endShape(CLOSE); 
}


