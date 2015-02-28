

Square [ ] squareArray;


void setup() {
  
  size(400, 400);
  background(255);
  
  squareArray = new Square [7];
  initializeSquareArray();
  
  rectMode(CENTER);

}

void draw() {
  for(int i = 0; i < squareArray.length; i++) {
    squareArray[i].growth();
    squareArray[i].drawSquare();
  }
}

void initializeSquareArray() {
  for(int i = 0; i < squareArray.length; i++) {
    squareArray[i] = new Square(int(random(0, width)), int(random(0, height)), 1, color(random(0, 180), random(0, 100), random(0, 255)));
  }
}

class Square {
  
  int x;
  int y;
  int diam;
  color squareColor;
  
  Square(int tempx, int tempy, int tempdiam, color tempsquareColor) {
    
    x = tempx;
    y = tempy;
    diam = tempdiam;
    squareColor = tempsquareColor;
    
  }
  
  void drawSquare() {
    stroke(squareColor);
    noFill();
    rect(x, y, diam, diam);
  }
  
  void growth() {
    diam = int(frameCount); 
  }
}


