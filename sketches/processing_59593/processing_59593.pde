
void setup() {
  size(400, 300); 
  rectMode(CENTER);
  smooth();
  noFill();
}
 
void draw() {
  background(240, 229, 17);
  translate(width/2, height/2);
  for (int i=0; i < 100; i++) {
    float angle = map(mouseX, 0, width, 0, PI);
    rotate(angle);
    float s = map(mouseY, 0, height, 1.1, 1.4);
    scale(s);
    ellipse(0, 0, 20, 20);
    rect(0, 0, 20, 20);
  } 
}


