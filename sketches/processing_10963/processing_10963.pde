
void draw() {
  strokeWeight(40);
  stroke(random(255),random(255),random(255));
  point(mouseX,mouseY);
  filter(BLUR,10);
  filter(POSTERIZE,6);
}


