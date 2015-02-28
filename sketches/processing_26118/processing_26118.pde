
// Drawing curves using curveVertex() 

float h = 100;  // position
float d = 1;    // direction

void setup() {
  size(300, 300);  
  smooth();
}

void draw() {
  background(64);
  stroke(255);
  
  //noFill();
  fill(128);
  
  beginShape();
  curveVertex(50, 150);
  curveVertex(50, 150);
  curveVertex(100, h);
  curveVertex(200, 300-h);
  curveVertex(250, 150);
  // the first and last points are used to guide the begining
  // and end of a curve.. we can make the last point interactive
  // to see how that works
  curveVertex(mouseX, mouseY); 
  endShape();
  
  stroke(0, 255, 0);
  line(250, 150, mouseX, mouseY);
  
  h += d;
  if ( h > 200 || h < 100) {
    d *= -1;
  }
}
