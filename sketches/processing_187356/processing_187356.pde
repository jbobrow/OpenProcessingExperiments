
int gridSize = 40;
float x;
float y;

void setup(){
  size(640, 360); 
  background(0); 
  noStroke(); 
  frameRate(10);
}

void draw(){
  background(0);
  for (int x = gridSize; x <= width - gridSize; x += gridSize) {
    for (int y = gridSize; y <= height - gridSize; y += gridSize) {
      noStroke();
      fill(random(255), random(255), random(255));
      ellipse(x-1, y-1, mouseX-120, mouseY-120);
      stroke(255, 50);
      line(x, y, mouseX, height/2);
    }
  }
}
  
  


