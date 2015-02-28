
void setup() {
  size(900, 450);
  background(255);
  rect (115, 225, 10, 50);
  rect (25, 225, 10,50);
  rect (50,50,50,50);
  rect (25, 100 ,100 ,125);
  line (25, 150, 130,120);
  line (25, 150, 20, 140);
  line (20, 140, 25, 130);
  line (125, 150, 130, 120);
  line (130, 120, 130, 80);
  fill (0);
  ellipse (130, 120, 50 ,50);
}

void draw() {
  stroke(255);
  fill(0);
  if(mousePressed == true) {
    ellipse(mouseX, mouseY, 10, 10);
  }
  rect(width, height, -150,-150);
}
