
int raster = 50;
int counter;

void setup() {
  size(400, 400);
  smooth();
}

void draw() {
  background(255);
  float strokeWeightX = 0.5;
  float strokeWeightY = 0.5;
  for (int i = raster; i < height; i = i + raster) {
    for (int j = raster; j < width; j = j + raster) {
      pushMatrix();
      translate(j, i);
      pushMatrix();
      strokeWeight((strokeWeightX)+(strokeWeightY));
      fill(255-(i*0.15+j*0.15), j, i);
      rotate((j+i+counter)*0.04);
      rect(-10, -10, 20, 20);
      line(0, 0, 10, 0);
      popMatrix();
      popMatrix();
      strokeWeightX = strokeWeightX + 0.2;
    }
    strokeWeightY = strokeWeightY + 0.2;
  }
  if (mousePressed) {
    counter--;
  }
  else {
    counter++;
  }
}
