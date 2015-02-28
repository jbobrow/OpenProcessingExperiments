
void setup() {
  size(500,500);
  background(255);
}


void draw() {

  //println (abs(mouseX-pmouseX));
  strokeWeight(abs(mouseX-pmouseX));
  strokeCap(ROUND);
  ellipse(mouseX, mouseY, pmouseX, pmouseY);

}


void mousePressed() {
    fill(mouseX, mouseY, 5, 15);
    stroke(mouseX, mouseY, 50, 155);

}

void keyPressed() {
    fill(mouseX, mouseY, 50, 75);
    saveFrame("schlauch.png");
}

