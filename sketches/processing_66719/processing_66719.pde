
void setup() {
  size(400, 400);
  background(255);
  drawGrapeCluster(6, color(35, 200, 49), 10, 200, 200);
  drawGrapeCluster(6, color(35, 200, 49), 10, 100, 200);
  drawGrapeCluster(6, color(255, 0, 49), 10, 300, 200);
  drawGrapeCluster(6, color(35, 200, 49), 10, 50, 50);
  drawGrapeCluster(6, color(35, 200, 49), 10, 150, 350);
}

void draw() {
  drawGrapeCluster(6, color(35, 200, 49), 10, 150, 350);
  //  drawGrapeCluster();
}

void drawGrapeCluster(int grapeSize, color grapeColor, int numberOfGrapes, int positionClusterX, int positionClusterY) {

  fill(grapeColor);
  for (int i = 0; i<numberOfGrapes; i++) {
    ellipse(positionClusterX+random(-15, 15), positionClusterY+random(-25, 25), grapeSize, grapeSize);
  }
}


