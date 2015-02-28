
  void setup(){
  size(500,500);
  frameRate (25);
  background(0);
  smooth();
}
void draw(){
  noStroke();
  fill(random(255),random(255),random(255),random(255));
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,(150),(150));
}
void keyPressed() {
  background(0);
}


