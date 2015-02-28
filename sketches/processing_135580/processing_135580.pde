
 
float aumento=0;
void setup() {
  frameRate(6);
  size (600,600);
  smooth(5);
  noCursor();
  background (0);
  stroke(152,152,152);
  strokeWeight(2);
 
}
void draw() {
  ellipse (random(width), random(height),aumento, aumento);
  aumento =+ 0.1;
}

