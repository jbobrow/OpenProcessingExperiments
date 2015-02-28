
//Three crowns

void setup() {
  size(400, 400);
  background(0, 20, 255);
  noStroke();
}
//draws the three crowns over the screen
void draw() {
  for (int i = 50; i < width; i = i+125) {
    for (int j = 5; j < height; j = j+90) {
      figure(i, j);
    }
  }
}
//The function
void figure(float x, float y) {
  pushMatrix();
  translate(x, y);
  fill(250, 255, 0);
  quad(5, 5, 10, 10, 40, 10, 45, 5);
  triangle(0, 0, 5, 5, 15, 5);
  triangle(25, 0, 15, 5, 40, 5);
  triangle(50, 0, 45, 5, 40, 5);
  popMatrix();

  pushMatrix();
  translate(x-30, y+15);
  quad(5, 5, 10, 10, 40, 10, 45, 5);
  triangle(0, 0, 5, 5, 15, 5);
  triangle(25, 0, 15, 5, 40, 5);
  triangle(50, 0, 45, 5, 40, 5);
  popMatrix();

  pushMatrix();
  translate(x+30, y+15);
  quad(5, 5, 10, 10, 40, 10, 45, 5);
  triangle(0, 0, 5, 5, 15, 5);
  triangle(25, 0, 15, 5, 40, 5);
  triangle(50, 0, 45, 5, 40, 5);
  popMatrix();
}


