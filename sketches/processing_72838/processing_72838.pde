
//Embedded Iteration Assignment  
float cellSizeX = 25;
float cellSizeY = cellSizeX;
float dim = 20;
float thresh = 400;
float shiftCol = cos(radians(30))*dim;
float shiftRow = shiftCol+dim;
PVector attractor;


void setup() {
  size(900, 900);
  smooth();
}

void draw() {
  background(255,0,0);
  drawHexGrid();
}

void drawHex(float sideLength,float numSides,float A) {
  fill(250,148,46,A);
  stroke(195,25,17);
  strokeWeight(1);
  beginShape();
  for (int i=0; i<=numSides; i++) {
    float v1 = sin(i/numSides*TWO_PI)*sideLength;
    float v2 = cos(i/numSides*TWO_PI)*sideLength;
    vertex(v1, v2);
  }
  endShape();
}


void drawHexGrid() {
  float x = 0;
  float y = 0;
  attractor = new PVector(mouseX, mouseY);
  for (int i = 0; i<width/cellSizeX+2;i++) {
    for (int j = 0; j<height/cellSizeY+3; j++) {
      if (j%2 == 0) {
        x = i*cellSizeX-shiftCol*2;
      } 
      else {
        x = i*cellSizeX-shiftCol;
      }

      y = j*cellSizeY-shiftRow;
      pushMatrix();
      translate(x, y);
      float distance = dist(x, y, attractor.x, attractor.y);
      float scaleFactor = map(distance,0,thresh,.25,1);
      float alph = map(distance,0,thresh,255,100);
      if (distance<thresh) {
        drawHex(dim*scaleFactor,6.0,alph);
      }
      else {
        drawHex(dim,6.0,100);
      }
      popMatrix();
    }
  }
}
