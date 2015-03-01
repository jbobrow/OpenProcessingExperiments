

void setup() {
  size(400, 400);
  frameRate(4);
}

int gridSize = 50;

void draw() {

  background(0);
  drawPlus(25, 250, 150);
}

void drawPlus (int randomR, int randomG, int randomB) {
  for (int x = gridSize; x <= width - gridSize; x += gridSize) {
    for (int y = gridSize; y <= height - gridSize; y += gridSize) {
      smooth();
      rectMode(CENTER);
      noStroke();
      fill(random(0,randomR), random(0,randomG), random(0,randomB));
      rect (x-2, y-2, 5, 30); 
      rect (x-2, y-2, 30, 5);
      stroke(50,100,250);
      line (x, y, width/2, height/2);
    }
  }
}



