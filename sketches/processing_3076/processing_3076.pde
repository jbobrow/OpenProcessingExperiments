
int cellCountX = (int)pow(2, 5);
int cellCountY = (int)pow(2, 5);
int margin = 4;
color accentColor = #CC80EA;
int accentFreq = 16;

Cell cell[][];

void setup() {
  size(256, 256);
  background(#222222);
  frameRate(6);
  
  float arrayX = width / cellCountX;
  float arrayY = height / cellCountY;
  
  cell = new Cell[cellCountX][cellCountY];
  
  for(int x = 0; x < cellCountX; x++) {
    for(int y = 0; y < cellCountY; y++) {
      cell[x][y] = new Cell(arrayX*(0.5+x), arrayY*(0.5+y), arrayX-margin, arrayY-margin, #222222);
    }
  }
  
}

void draw() {
  
  color c;
  
  fill(#222222);
  
  for(int x = 0; x < cellCountX; x++) {
    for(int y = 0; y < cellCountY; y++) {
      
      int n = (int)random(accentFreq);
      
      if (n == accentFreq-1) {
        c = accentColor;
      } else {
        c = color(random(255));
      }
      
      cell[x][y].setColor(c);
      cell[x][y].draw();
    }
  }
}

void mousePressed() {
  if(mousePressed) {
    cellCountX = (int)pow(2, (int)random(1, 6));
    cellCountY = (int)pow(2, (int)random(1, 6));
    setup();
  }
}


