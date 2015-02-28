
void setup() {
  size(600, 600);
  smooth();
  noLoop();
}

void draw() {
  for(int i = 0; i<150; i++){
    ellipse(random(600), random(600), random(30,120), random(30,120));
    fill(random(255),random(255),random(255));
    rect(random(600), random(600), random(600), random(600));
    fill(random(255),random(255),random(255));
}
}

void mousePressed() {
redraw();
}


