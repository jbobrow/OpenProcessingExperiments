
int step;
color c;

void setup() {
  size(400, 400);
  background(255);
  smooth();
  noFill();
  strokeWeight(0.5);

  noStroke();
  fill(0);
  colorMode(RGB, 255);

  step = (width - 40) / 10;
  println(step);

  for (float gridY = step; gridY <= width - step; gridY = gridY += step) {
    for (float gridX = step; gridX <= width - step; gridX = gridX += step) {

      float rGridX = (gridX - step) + step * random(-1.4, 1.4);
      float rGridY = (gridY - step) + step * random(-1.4, 1.4);
      
      float distSize = 64 - dist(gridX, gridY, rGridX, rGridY) * .8;
   
      ellipse(rGridX, rGridY, distSize, distSize);
    }
  }
}


