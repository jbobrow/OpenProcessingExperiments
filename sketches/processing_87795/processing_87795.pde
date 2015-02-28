
void setup() {
  size(640, 500);
  smooth();
}

void draw() {
  background(255);  
  smooth();

  //face
  fill(230);
  noStroke();
  rect(215, 80, 220, 250, 60, 60, 90, 90);

  //eye
  strokeWeight(4);
  fill(255);
  float a = map(mouseX, 0, width, 40, 80);
  ellipse(267, 168, a, a);
  ellipse(380, 168, a, a);
  //pupil
  fill(0);
  float b = map(mouseX, 0, width, 10, 2);
  ellipse(267, 168, b, b);
  ellipse(380, 168, b, b);

  //eye brow
  stroke(0);
  float c = map(mouseX, 0, width, 150, 100);
  float d = map(mouseX, 0, width, 150, 70);
  rect(245, c, 40, 5);
  rect(360, d, 40, 5);

  //nose
  fill(0);
  float e = map(mouseX, 0, width, 5, 15);
  ellipse(310, 237, e, e);
  ellipse(340, 237, e, e);

  //frackels
  noStroke();
  fill(246, 78, 41);
  //right
  ellipse(345, 216, 4, 4);
  ellipse(355, 225, 4, 4);
  ellipse(365, 216, 4, 4);
  ellipse(375, 225, 4, 4);
  ellipse(385, 216, 4, 4);
  //left
  ellipse(300, 216, 4, 4);
  ellipse(290, 225, 4, 4);
  ellipse(280, 216, 4, 4);
  ellipse(270, 225, 4, 4);
  ellipse(260, 216, 4, 4);

  //mouth
  fill(246, 78, 41);
  float f = map(mouseX, 0, width, 5, 200);
  rect(288, 265, 75, f, 0, 0, 50, 50);
}



