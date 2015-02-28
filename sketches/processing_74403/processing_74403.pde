
void setup() {
  size(500, 500);
  smooth();
  frameRate(150);
  noCursor();
}

void draw() {
  if(mousePressed) {
    background(255);
  } 
  else {
    fill(0, 30);
    stroke(255);
    strokeWeight(1);
    ellipse(random(width), random(height), random(width), random(height));
    //strokeWeight(5);
    fill(0, 30);
    stroke(255);
    strokeWeight(5);
    ellipse(mouseX, mouseY, 100, 100);
    fill(0);
    stroke(255);
    strokeWeight(5);
    ellipse(mouseX, mouseY, 100, 100);
  }
}
