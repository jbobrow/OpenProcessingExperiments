
PVector location;
void setup() {
  size(800, 800);
  background(232, 217, 255);
  smooth();
  location = new PVector();
}

void draw() {

  fill(255);
  stroke(165, 102, 255);
  ellipse(400, 400, 400, 400);

  strokeWeight(2);
  for (int i = 0; i < 12; i++) {
    float dx = cos(i * TWO_PI / 12);
    float dy = sin(i * TWO_PI / 12); 
    line(400 + 160 * dx, 400 + 160 * dy, 400 + 175 * dx, 400 + 175 * dy);
  }


  if ( !mousePressed ) {
    int s = second();
    stroke(63, 0, 153);
    strokeWeight(2);
    drawHand(170, s, 60);
    int m = minute();
    strokeWeight(5);
    drawHand(140, m, 60);
    int h = hour();
    strokeWeight(8);
    drawHand(110, h, 12);
    noStroke();
    fill(165, 102, 255);
    ellipse(400, 400, 50, 50);
  } 
  else if ( mousePressed && (mouseButton == LEFT)) {
    pushMatrix();
    translate(mouseX, mouseY);
    drawBall();
    popMatrix();
    location = new PVector(mouseX-400, mouseY-400);
    location.normalize();
    location.mult(170);

    int s = mouseX/20;
    stroke(63, 0, 153);
    strokeWeight(2);
    line(400, 400, 400+location.x, 400+location.y);
    int m = minute();
    strokeWeight(5);
    drawHand(140, m, 60);
    int h = hour();
    strokeWeight(8);
    drawHand(110, h, 12);
    noStroke();
    fill(165, 102, 255);
    ellipse(400, 400, 50, 50);
  } 
  else if ( mousePressed && (mouseButton == RIGHT)) {
    background(232, 217, 255);
  }
}

void drawHand(float radius, float value, float divider) {
  float x = 400 + radius * cos(value * TWO_PI / divider - PI / 2.0f);
  float y = 400 + radius * sin(value * TWO_PI / divider - PI / 2.0f); 
  line(400, 400, x, y);
}

void drawBall() {
  // background(232, 217, 255);
  noStroke();
  pushMatrix();
  translate(random(-15, 15), random(-15, 15));
  scale(random(0.3, 4));
  fill(random(160, 210), random(1, 102), 255, random(1, 70));
  ellipse(0, 0, 50, 50);
  popMatrix();
}
