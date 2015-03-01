
void setup ()

{  
  size(640, 360); 
  background(0); 
  noStroke(); 
}

void draw() {
   drawDiscoLights(10,20);
}

void drawDiscoLights(int numberofCircles, int theSize){
int gridSize = 40;
for (int x = gridSize; x <= width - gridSize; x += gridSize) {
  for (int y = gridSize; y <= height - gridSize; y += gridSize) {
    noStroke();
    fill(random(256), random(256), random(256));
    ellipse(x, y, theSize, theSize);
    ellipse(x+10,y+10, theSize, theSize);
  }
}
}


