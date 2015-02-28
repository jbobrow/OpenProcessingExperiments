
int squareSize;
int size2;
int newHeight;
int newWidth;
int next;
int timeDelay;
int colorful;
int[] rows;
Location[] points;
Location[] level;
Square[] blocks;
color[] colors;

void setup() {
  stroke(255);
  size(300, 300);
  squareSize = 20;
  setVariables();
  background(0);
}

void draw() {
  background(0);
   rows = new int[newWidth];
    if (millis() > next) {
      new Square();
      next = millis() + timeDelay;
    }
    for (int i = 0; i < blocks.length; i++) {
      blocks[i].draws();
    } 
}

void setVariables() {
  timeDelay = 100;
  size2 = 10;
  pickAColor();
  newWidth = (width )/size2;
  newHeight = (height)/size2;
  rows = new int[newWidth];
  int decx = (width - (newWidth * squareSize));
  int decy = (height - (newHeight * squareSize)); ///2+20;
  blocks = new Square[0];
  points = new Location[0];
  level = new Location[0];
  for(int a = 0; a < newWidth; a++){
    for(int b = 0; b < newHeight; b++){
      new Location(a, b, decx, decy);
    }
  } 
  
}

void pickAColor() {
  colors = new color[4];
  colors[0] = color(51, 0, 255);
  colors[1] = color(51, 255, 255);
  colors[2] = color(102, 255, 102);
  colors[3] = color(204, 0, 204);
  
}
class Square {
  Location place;
  Square() {
    colorful = round(random(colors.length));
      if (colorful == 4) {
        colorful = colorful - 1;
      }
    blocks = (Square[]) append (blocks, this);
    place = level[0];
    advancePlaces();
    place.marker = this;
    place.empty = false;
  }
  void draws() {
    if(place != null) {
      stroke(153);
      fill(colors[colorful]);
      rect(place.x, place.y, squareSize, squareSize);
      place.verifyNext();
      noStroke();
    }
  }
}

void advancePlaces() {
  Location zero = level[0];
  level = (Location[]) subset (level, 1);
  level = (Location[]) append (level, zero);
  
}

class Location {
  int x;
  int y;
  int col;
  int row;
  int[] neighbors;
  Square marker;
  boolean empty = true;
  Location(int c, int r, int decx, int decy) {
    col = c;
    row = r;
    x = c * squareSize + decx;
    y = r * squareSize + decy;
    neighbors = getNeighbors(c, r);
    points = (Location[]) append (points, this);
    if (r == 0) {
      level = (Location[]) append (level, this);
    }
  }
  
  void verifyNext() {
    int nextSpace = neighbors[4];
    if (nextSpace != -1) {
      Location p = points[nextSpace];
      if (p.empty) {
        empty = true;
        p.empty = false;
        p.marker = marker;
        marker.place = p;
        marker = null;
      }
    }
  }
}

int[] getNeighbors(int c, int r) {
  int[] neighbors = {(r) + (c) * newHeight, -1, -1, -1, -1};
 if(c > 0){
    neighbors[1] = (r + (c-1) * newHeight);
  }
  if(c < (newWidth - 1)){
    neighbors[2] = (r) + (c+1) * newHeight;
  }
  if(r > 0){
    neighbors[3] = (r-1) + (c) * newHeight;
  }
  if(r < (newHeight - 1)){
    neighbors[4] = (r+1) + (c) * newHeight;
  } 
  return neighbors;
}

