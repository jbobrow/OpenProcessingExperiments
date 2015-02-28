
void setup() {
  size(500, 500);
  smooth();
   background(211, 142, 227);
}


void draw() {
  noStroke();
  float fill = dist(mouseX, mouseY, pmouseX, pmouseY);
       fill(0, 255, mouseX, mouseY);
  ellipse(mouseX, mouseY, fill, -fill);
  stroke(100, mouseX, mouseY);
  for (int x=mouseX; x <= height-20; x += 60)
  line(mouseY, mouseX, mouseX, mouseY);
}

