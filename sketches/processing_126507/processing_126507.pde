


void setup() {  //setup function called initially, only once
  size(250, 250);
   background(10, 80, 100);
}

void draw() {
  if (keyPressed) {
    stroke(random(255), random(255), random(255));
    fill(random(255), random(255), random(255));
    ellipse(random(1000), random(750), random(40), random(40));
  }
  if(mousePressed) {
    background(10, 80, 100);
  }
}
