
//found info on processing.org for translate

void setup() {
  size(300, 300);
  background(255);
  noStroke();
  //sets up the units to move the graph
  for (int i = 0; i < 300; i = i + 20) {
    for (int j = 0; j < 300; j = j + 50) {
      figure(i, j);
    }
  }
}
float colorrandom;

void figure(float x, float y) {
  pushMatrix();
  //moves the grid to fill the window with quads x 20 units and y 50 units
  translate(x, y);
  colorrandom = random(100);
  if (colorrandom < 40) {
    fill(255);
  }
  else {
    fill(40, 140, 190);
  }
  quad(10, 0, 20, 25, 10, 50, 0, 25);
  if (colorrandom < 30) {
    fill(250, 50, 0);
  }
  else {
    fill(255);
  }
  quad(20, 25, 30, 50, 20, 75, 10, 50);
  popMatrix();
}


