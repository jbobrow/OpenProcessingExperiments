
void setup() {
  size(600, 400);
  rectMode(CENTER);
  frameRate(1);
  strokeWeight(1.5);
}

void draw() {
  cuboid(100);
}

void cuboid(int gridSize) { 
  background(#509cf2);
  int squareLength = gridSize/2;
  
  for (int x = gridSize; x <= width - gridSize; x += gridSize) {
    for (int y = gridSize; y <= height - gridSize; y += gridSize) {   
      fill(#000000);
      rect(x, y, squareLength, squareLength);
      
      float colorNum = random(155) + 100;
      fill(colorNum);
      
      float cuboidHeight = random((gridSize/3));
      
      rect((x-cuboidHeight), (y-cuboidHeight), squareLength, squareLength);
      quad((x-(squareLength/2)), (y+(squareLength/2)), (x+(squareLength/2)), (y+(squareLength/2)), ((x-cuboidHeight)+(squareLength/2)), ((y-cuboidHeight)+(squareLength/2)), ((x-cuboidHeight)-(squareLength/2)), ((y-cuboidHeight)+(squareLength/2)));
      quad((x+(squareLength/2)), (y+(squareLength/2)), ((x-cuboidHeight)+(squareLength/2)), ((y-cuboidHeight)+(squareLength/2)), ((x-cuboidHeight)+(squareLength/2)), ((y-cuboidHeight)-(squareLength/2)), (x+(squareLength/2)), (y-(squareLength/2)));
    }
  }
}




