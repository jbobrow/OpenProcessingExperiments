
/*
 Konkuk University
 SOS iDesign
 Name: Hyeri Jeong
 ID: 201420107 Hyeri Jeong
 */

float dia=100;

void setup() {
  size (600, 600);
  smooth();
  background(200);
}

void draw() {
  //large face
  stroke(0);
  fill (255, 237, 178);
  strokeWeight(12);
  ellipse(300, 300, 500, 500);

  //eye
  stroke(0);
  fill(255);
  strokeWeight(5);
  ellipse(400, 200, 100, 150);
  ellipse(200, 200, 100, 150);
  fill(mouseX, mouseY, 100);
  ellipse(200, 200, 50, 50);
  ellipse(400, 200, 50, 50);

  //mouth
  stroke(0);
  fill(255, 137, 126);
  strokeWeight(2);
  bezier(158, 361, 157, 500, 446, 500, 446, 361);
  strokeWeight(2);
  line(158, 361, 446, 361);
  fill(255);
  strokeWeight(2);
  bezier(234, 363, 233, 421, 371, 421, 369, 363);
  strokeWeight(2);
  line(302, 364, 302, 405);
  strokeWeight(2);
  noFill();
  bezier(233, 472, 248, 498, 355, 496, 365, 472);

  //cheek
  noStroke();
  fill(255, 123, 111);
  ellipse(143, 313, 100, 50);
  ellipse(461, 313, 100, 50);

  //hair
  fill(0);
  bezier(137, 112, 137, 25, 461, 25, 461, 112);
  triangle(279, 10, 347, 10, 299, 61);

  //nose
  stroke(0);
  fill(0);
  ellipse(273, 288, 5, 5);
  ellipse(336, 288, 5, 5);

  //background ellipse
  if (mousePressed) {
    stroke(255);
    strokeWeight(10);
    fill(mouseX, mouseY, 0);
    ellipse(mouseX, mouseY, dia, dia);
    ellipse(width-mouseX, height-mouseY, dia, dia);
    ellipse(mouseX, height-mouseY, dia, dia);
    ellipse(width-mouseX, mouseY, dia, dia);
  }
}

void keyPressed() {
  setup();
}
