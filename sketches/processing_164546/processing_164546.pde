
void setup(){
  size(500,500);
  background(245, 174, 199);
}

void draw(){
  filter(BLUR);
    fill(random(203, 218), random(181, 240), random(240, 181));
    stroke(1);
    ellipse(random(225, 275), random(225, 275), 25, 25);
  filter(DILATE);
  if (mousePressed) {
   fill(random(174, 245), random(182, 237), random(245, 174));
   ellipse(mouseY, mouseX, 50, 50);
  }
  if (mousePressed) {
   fill(random(mouseX, mouseY), 0, random(mouseX, mouseY));
   rect(mouseX + random(-25, 25), mouseY + random(-25, 25), 5, 5);
  }
}
