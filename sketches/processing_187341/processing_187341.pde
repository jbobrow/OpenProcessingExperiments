


void setup() {
size(640, 360);
background(0);
frameRate(4);

}


void draw() {
  shiningFlowers();
}
int gridSize = 40;

void shiningFlowers() {
for (int x= gridSize; x <= width - gridSize; x+= gridSize) {
  for (int y = gridSize; y <= height - gridSize; y += gridSize) {
   
    smooth();
    fill(random(0,255), random(0, 255), random(0, 255));
    ellipse(x-2, y-2, 6, 20);
    ellipse(x-2, y-2, 20, 6);
    
  }
}
}

void mousePressed() {
  for (int x= gridSize; x <= width - gridSize; x+= gridSize) {
  for (int y = gridSize; y <= height - gridSize; y += gridSize) {
   
  background(random(150, 255), random(150, 255), random(150, 255));
  shiningFlowers();
  
   }
  }
}


