
void setup() {
  size(1800,980);
  background(255,0,255);
}
void draw() {
  fill(random(255), random(255), random(255));
  stroke(random(255), random(255), random(255));
  strokeWeight(random(10));
  ellipse(mouseX, mouseY, random(255), random(255));
}  
void mousePressed() {
  background(random(255), random(255), random(255));
}                
