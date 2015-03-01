
void setup () {
  size (500, 500);
}

void draw() {

  if (mousePressed == true) {
    noFill();
    stroke(random(1000), random(1000), random(1000));
    ellipse(mouseX, mouseY, random(45), random(45));
  }
  
}

