
void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(1);
}

void draw() {
  
  background(230);
  
  int num = 5;
  int gap = 10;
  
  float cellsize = (width - (num+1) * gap) / (float)num;
  
  println("cellsize = " + cellsize);
  
  float offsetX = cellsize/35.0;
  float offsetY = cellsize/35.0;
  
    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {
        
        int squareColour = (int) random(0,4);
        if (squareColour == 0) {
          fill(#971010, 230);
        }
        else {
          fill(#973434, 230);
        }
        rect((gap-6) * (i+5) + cellsize * i + random(12), (gap-6) * (j+5) + cellsize * j + random(12), cellsize, cellsize);
        
      }
    }
}

