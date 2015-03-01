
void setup() { 
  size(600, 600);
}

void waterforce (float x1, float y1, float x2, float y2, 
float x3, float y3, float x4, float y4) { // equivalent to Processing curve() function
  beginShape();
  for (float t=0; t<=1; t+=0.02) {
    float t2 = t*t*2;
    float t3 = t2*t*5;
    float x= (-.5*x1 + 1.5*x2 -1.5*x3 + .5*x4)*t3 + (x1 -2.5*x2 +2*x3 -.5*x4)*t2 + (-.5*x1 + .5*x3)*t + x2; 
    float y= (-.5*y1 + 1.5*y2 -1.5*y3 + .5*y4)*t3 + (y1 -2.5*y2 +2*y3 -.5*y4)*t2 + (-.5*y1 + .5*y3)*t + y2; 
    vertex(x, y);
  }
  endShape();
}

void draw() { 
  background(255);
  strokeWeight(10);
  waterforce(0, 0, 100, 300, mouseX, mouseY, width-100, 300 ); 
  waterforce(100, 300, mouseX, mouseY, width-100, 300, width, 0);
}
