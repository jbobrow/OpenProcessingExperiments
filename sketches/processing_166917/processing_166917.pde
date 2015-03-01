
float[] xCoord = new float[500];
float[] yCoord = new float[500];
float [] speed= new float [500];
void setup() {
  size(400, 400);
  for (int i = 0; i < 100; i++) {
    xCoord[i] = random(width);
    yCoord[i] = random(height);
    speed [i]=random (2, 5);
  }
}

void draw() {
  background(0, 0, 255);
  stroke(255);
  strokeWeight (30);
  fill (10, 100, 255);
  ellipse (mouseX, mouseY, 400, 400);

  strokeWeight (3);
  for (int i = 0; i < 100; i++) {
    xCoord [i]+=random (-1, 1);
    yCoord[i] -=2;
    if (yCoord[i] <0) yCoord [i]+=height;
    if (dist(mouseX, mouseY, xCoord[i], yCoord[i])<200) {
      noFill();
      ellipse (xCoord[i], yCoord[i], 4, 4);
    }
  }
}
