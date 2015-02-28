


void setup() {
  size(400, 400);
  smooth();
  //ellipseMode(CENTER);
  background(0);
}

void draw() {
  for(int y = 0; y <= height; y += 30) {
    for(int x = 0; x <= width; x += 20) {
  ourFirstFunction(x, y);
    }
  }
}

void ourFirstFunction(int xPos, int yPos) {
  noStroke();
  //fill(rColor, gColor, bColor, alph);
  fill(random(255), random(150), random(255));
  ellipse(xPos, yPos, 10, 10);
}


