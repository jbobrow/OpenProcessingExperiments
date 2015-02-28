
void setup() {
  size (100,100);
  frameRate(6);
  smooth();
}

void draw() {
  background(0);
  
  float l = random(5,95);
  float r = random(-5,5);
  float c = random(0,255);
  
  stroke(c);
  line(0,l,100,l+r);
}
