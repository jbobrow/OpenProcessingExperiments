
Rectangle[] rects; 

float lineWidth = 5;
int numRects = 16; 
float margin = 20; 
float gap = 40; 
float rectSize;  

void setup() {
  size(400, 400); 
  background(255);   
  frameRate(10); 
  noStroke(); 

  rects = new Rectangle[numRects]; 
  rectSize = ( width - (2 * margin) - gap * (sqrt(numRects) - 1) ) / sqrt(numRects);   

  float rx, ry; 
  int num = 0;
  float xOff = 0;  
  for (int i = 0; i < sqrt (numRects); i++) {
    for (int j = 0; j < sqrt (numRects); j++) {
      rx = margin + rectSize * i + gap * i;    
      ry = margin + rectSize * j + gap * j;
      rects[num] = new Rectangle(rx, ry, rectSize, xOff);
      num++;
    }
    xOff += lineWidth/3;
  }
}


void draw() {
  if(mousePressed){
    lineWidth = map(mouseX, 0, width, 2, 15); 
    println("line width: ", lineWidth); 
  }
  
  drawBackground(); 
  for (int i = 0; i < numRects; i++) {
    rects[i].drawRectangle();
  }
 
}

class Rectangle {
  float cx, cy;    // upper left corner
  float rSize;     // rect size   
  float xStart; 

  Rectangle(float _x, float _y, float _size, float _xOff) {
    cx = _x; 
    cy = _y; 
    rSize = _size;
    xStart = cx + _xOff; //cx;
  }

  void drawRectangle() {
    float x; 
    float rWidth; 

    fill(255); 
    rect(cx, cy, rSize, rSize); 

    fill(0); 
    rWidth = lineWidth;

    for (float xOff = xStart; xOff < cx + rSize; xOff += 2*lineWidth) {
      x = xOff; 
      if (xOff < cx) {
        x = cx; 
        rWidth = lineWidth - (cx - xOff);
      } else {
        x = xOff; 
        rWidth = lineWidth;
      } 

      if (xOff + lineWidth > cx + rSize) {
        rWidth = lineWidth - ((xOff + lineWidth) - (cx + rSize));
      }

      rect(x, cy, rWidth, rSize);
    }
    xStart++; 
    if (xStart > cx + lineWidth) {
      xStart = cx - lineWidth + 1;
    }
  }
}

void drawBackground() {  
  fill(255); 
  rect(0, 0, width, height); 
  fill(0);  
  for (float x = 0; x < width; x += 2*lineWidth) {
    rect(x, 0, lineWidth, height);
  }
}



