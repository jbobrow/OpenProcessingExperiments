
void setup() {
  size(400,400);
  background(255,199,174);
  strokeWeight(.5);
  stroke(255);
}

void draw() {
  fill(198,227,171);
  triangle(random(250),random(250),mouseX,mouseY,mouseX,mouseY);
}               
