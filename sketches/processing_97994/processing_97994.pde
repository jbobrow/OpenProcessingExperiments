
void setup() {
  size(750, 500);
}
void draw() {
  background(8, 216, 255);
  stroke(0);
  fill(240);

  //nature
  //grass
  rectMode(CORNERS);
  noStroke();
  fill(103, 214, 60);
  rect(0, 400, 750, 500);
  //sun
  ellipseMode(CENTER);
  fill(237, 230, 0);
  ellipse(0, 0, 150, 150);

  //flower
  //stem
  stroke(8, 131, 0);
  strokeWeight(5);
  line(375, 220, 375, 420);
  //petals
  stroke(0);
  strokeWeight(1);
  ellipseMode(CENTER);
  fill(247, 0, 236);
  ellipse(340, 240, 50, 50);
  ellipse(410, 240, 50, 50);
  ellipse(375, 275, 50, 50);
  ellipse(375, 210, 50, 50);
  ellipse(395, 265, 50, 50);
  ellipse(395, 225, 50, 50);
  ellipse(355, 265, 50, 50);
  ellipse(355, 225, 50, 50);
  //flower core
  noStroke();
  ellipseMode(CENTER);
  fill(255, 213, 0);
  ellipse(375, 240, 75, 75);

  //butterfly wings
  fill(167, 0, 252);
  ellipse(mouseX-5, mouseY-5, 15, 15);
  ellipse(mouseX+5, mouseY+5, 15, 15);
  ellipse(mouseX-5, mouseY+5, 15, 15);
  ellipse(mouseX+5, mouseY-5, 15, 15);
  //butterfly head
  fill(255, 0, 0);
  ellipse(mouseX, mouseY-9, 7, 7);
  //antenna
  stroke(0);
  strokeWeight(3);
  line(mouseX, mouseY-13, mouseX+3, mouseY-17);
  line(mouseX, mouseY-13, mouseX-3, mouseY-17);
}



