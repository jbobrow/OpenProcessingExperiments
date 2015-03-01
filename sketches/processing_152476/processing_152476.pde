
void setup () {
  size(400, 300);
  noLoop();
}

void draw () {
  for (int x = 0; x < width; x+= 20) {
    for (int y = 0; y < height; y +=20) {
      float z = random (0, PI);
      pushMatrix(); // return 0, 0 to the top left corner
      translate(x, y);
      // moving the shape with x and y
      rotate(z);
      rect(0, 0, 10, 10);
      //leave rect at 0, 0 rotates our rectangle in its position rather than the x axis
      popMatrix();
    }
  }
}
