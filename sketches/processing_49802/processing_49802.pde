
//created by luis gil
//www.legil.org

int x;
int y;
float ease = 0.05;

void setup() {
  size(500, 450);
  stroke(0, 100);
  strokeWeight(1);
  smooth();
  noFill();
}

void draw() {
  background(255);
  for (int i = 50; i < 500; i += 25) {
    for (int j = 50; j < 500; j += 25) {
      lineRot(i, j);
    }
  }
  //fill(255, 150);
  //ellipse(mouseX, mouseY, 20, 20);
}

void lineRot(int xPos, int yPos) {
  pushMatrix();
  translate(xPos, yPos);
  
  float sizeOf = dist(mouseX, mouseY, xPos, yPos);

  ellipse(0, 0, width/3 - sizeOf/2, height/3 - sizeOf/2);
  popMatrix();
}

void mousePressed() {
  save("circles.png");
}
