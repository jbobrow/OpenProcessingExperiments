

void setup() {
  size(400, 400);
  smooth();
  noStroke();
}

void draw() {
  // set a white background with transparency
  fill(255, 100);
  rect(0, 0, 400, 400);

  // draw the floor
  fill(200, 100);
  rect(0, mouseY, 400, 601);

  // draw the ellipses
  fill(0, 255, 100, 200);
  ellipse(350, 180-mouseX/64-200+mouseY, 40, 40);
  ellipse(350, 220+mouseX/64-200+mouseY, 40, 40);
  ellipse(300, 180-mouseX/32-200+mouseY, 40, 40);
  ellipse(300, 220+mouseX/32-200+mouseY, 40, 40);
  ellipse(250, 180-mouseX/16-200+mouseY, 40, 40);
  ellipse(250, 220+mouseX/16-200+mouseY, 40, 40);
  ellipse(200, 180-mouseX/8-200+mouseY, 40, 40);
  ellipse(200, 220+mouseX/8-200+mouseY, 40, 40);
  ellipse(150, 180-mouseX/4-200+mouseY, 40, 40);
  ellipse(150, 220+mouseX/4-200+mouseY, 40, 40);
  ellipse(100, 180-mouseX/2-200+mouseY, 40, 40);
  ellipse(100, 220+mouseX/2-200+mouseY, 40, 40);
  ellipse(50, 180-mouseX-200+mouseY, 40, 40);
  ellipse(50, 220+mouseX-200+mouseY, 40, 40);
}
