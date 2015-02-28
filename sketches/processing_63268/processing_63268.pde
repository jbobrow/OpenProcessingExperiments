
void setup() {
  
  size(500, 500);
  smooth();
  stroke(50);
  ellipseMode(CENTER);
}


void draw() {


  float d = random(500);
  float r = random(255);
  float g = random(255);
  float b = random(255);

  if (mousePressed) {
    fill(r, g, b);
    translate(mouseX, mouseY);
    ellipse(mouseX, mouseY, d, d);
  }

  else {
    fill(20, 40, 50,90);
    ellipse(mouseX, mouseY, d, d);
  }
}


