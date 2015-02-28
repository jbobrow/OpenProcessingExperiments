
void setup() {
  size(600, 600);

  background(179, 207, 222);
  smooth();
}

void draw() {
  // println(mouseX + " " + mouseY);
  line(mouseX, mouseY, pmouseY, pmouseX);
  stroke(random(100), random(100), random(255));
  strokeWeight(random(1,10));
}

void mousePressed() {
  background(179, 207, 222);      // clears the background
}



