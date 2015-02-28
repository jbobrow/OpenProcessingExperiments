
void setup() {
  size(500, 500);
}

void draw() {
  if (mousePressed) {
    colorMode(HSB, 360, 100, 100);
    fill(random(0, 50), random(50, 100), random(0, 100));
    noStroke();
    ellipse(mouseX+random(0,20), mouseY+random(0,20), random(5,15), random(5,15));
    ellipse(mouseX+random(0,-20), mouseY+random(0,-20), random(5,15), random(5,15));
  } 
}



