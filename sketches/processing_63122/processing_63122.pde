
void setup() {
  size(640, 480);
  smooth();
}
void draw() {
  noFill();
  background(255);
  line(width/2, 0, width/2, height);

  if (mouseX <= width/2)
  {
    ellipse(width/2, height/2, 200, 200);
  }

  rect(50, 50, width-100, height-100);
}


