


void setup() {
  size(800, 600);
}

void draw() {
  if (mousePressed == true) {
   saveFrame(); 
  }
  background(0);
  drawBody();
  drawHair();
  drawFace();
  drawHat();
}

void drawFace() {
  noStroke();
  fill(188, random(140, 180), 123);
  beginShape();
  vertex(400, 100);
  vertex(500, 300);
  vertex(400, 400);
  vertex(300, 300);
  endShape();
}

void drawHair() {
  noStroke();
  fill(185, 45, 6);
  beginShape();
  vertex(300, 200);
  vertex(400, 100);
  vertex(500, 200);
  vertex(500, 400);
  vertex(400, 500);
  vertex(300, 400);
  endShape();
}

void drawHat() {
  noStroke();
  //Draw the rim
  fill(187, 237, 24);
  beginShape();
  vertex(200, 100);
  vertex(600, 100);
  vertex(500, 200);
  vertex(400, 100);
  vertex(300, 200);
  //vertex(300,100);
  endShape(CLOSE);

  //Draw the outside top
  fill(48, 126, 24);
  beginShape();
  vertex(300, 0);
  vertex(400, 75);
  vertex(500, 0);
  vertex(500, 100);
  vertex(300, 100);
  endShape();

  //Draw the inside top
  fill(187, 237, 24);
  beginShape();
  vertex(300, 0);
  vertex(500, 0);
  vertex(400, 75);
  endShape();
}

void drawBody() {
  //Draw the left side
  fill(117, 141, 232);
  beginShape();
  vertex(0, 300);
  vertex(400, 300);
  vertex(400, 600);
  vertex(100, 600);
  endShape();

  //Draw the right side
  fill(42, 68, 167);
  beginShape();
  vertex(400, 300);
  vertex(800, 300);
  vertex(700, 600);
  vertex(400, 600);
  endShape();
}



