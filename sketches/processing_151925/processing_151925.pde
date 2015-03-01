

int nat = 250;
int howe = 400;

void setup() {
  size(500, 500);
  background(255);
}

void draw() {  
  noFill();
  colorMode(HSB,100);
  stroke(random(255), 50, 100);
  ellipse(mouseX, mouseY, mouseX/HALF_PI, mouseY/PI+TWO_PI); 
}

