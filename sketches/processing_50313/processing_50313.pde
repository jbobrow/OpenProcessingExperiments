
int outChange = 0;
int turnChange = 0;

void setup() {
  size(640, 480);
}

void draw() {
  background(255);
//  Set center coordinates
  int xCent = width / 2;
  int yCent = height / 2;
  fill(0);
//  Draw big circle
  beginShape();
  for(int i = 0; i <= 20; i++) {
    float lineAng = radians((18 * i) + turnChange);
    float xCord = xCent + ((yCent + outChange) * cos(lineAng));
    float yCord = yCent + ((yCent + outChange) * sin(lineAng));
//    Init circle nodes reacting to mouse clicks
    if (mousePressed && dist(mouseX, mouseY, xCord, yCord) <= 200) {
        vertex(mouseX, mouseY);
    }
    else {
      vertex(xCord, yCord);
    }
  }
  endShape(CLOSE);
  fill(255);
//  Draw small circle
  beginShape();
  for(int i = 0; i <= 20; i++) {
    float lineAng = radians((18 * i) + turnChange);
    float xCord = xCent + ((40 + outChange) * cos(lineAng));
    float yCord = yCent + ((40 + outChange) * sin(lineAng));
//    Same interactions with mouse
    if (mousePressed && dist(mouseX, mouseY, xCord, yCord) <= 40) {
        vertex(mouseX, mouseY);
    }
    else {
      vertex(xCord, yCord);
    }
  }
  endShape(CLOSE);
//  Track mouse with white line
  stroke(255);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

