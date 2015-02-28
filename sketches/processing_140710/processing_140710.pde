

size(640, 360); 
background(0); 
noStroke(); 

int gridSize = 40;

for (int x = gridSize; x <= width - gridSize; x += gridSize) {
  for (int y = gridSize; y <= height - gridSize; y += gridSize) {
    noStroke();
    fill(255,255,255,60);
    ellipse(x, y, 30, 30);
    stroke(255, 120);
    strokeWeight(1);
    
    line(x-15, y, x, y+40);
    line(x+15, y, x, y+40);
    line(x-15, y, x, y-40);
    line(x+15, y, x, y-40);
    line(x, y-15, x+40, y);
    line(x, y+15, x+40, y);
    line(x, y-15, x-40, y);
    line(x, y+15, x-40, y);
  }
}





