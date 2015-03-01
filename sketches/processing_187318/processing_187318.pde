
void setup () {

  size(640, 360); 
  background(#FF69B4); 
  noStroke();
}

void draw () {
  int gridSize = 40;

  for (int x = gridSize; x <= width - gridSize; x += gridSize) {
    for (int y = gridSize; y <= height - gridSize; y += gridSize) {
      noStroke();
      fill((400), random(400), random(400));
      ellipse(x-3, y-3, 35, 40);
      rect(x-1, y-1, 25, 30);
      line(x, y, width/2, height/2);
    }
  }
}
