
void setup() {
  size(600,600);
  colorMode(HSB);
}
void draw() {
  float vel= dist(mouseX,mouseY,pmouseX,pmouseY);
  line(mouseX,mouseY,pmouseX,pmouseY);
  strokeWeight(vel);
  
}
