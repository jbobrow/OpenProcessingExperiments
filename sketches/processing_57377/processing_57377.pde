
// A Cell object

class Cell {

  // A cell object knows about its location in the grid as well as its size with the variables x, y, w, h.
  float x,y;   // x,y location
  float w,h;   // width and height
  float c; // ellipse color
  
  float time = 0.0;
  float increment = 0.01;
  float n = noise(time)*20;
  
  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH, float tempColor) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    c = tempColor;
  }
  
  void display() {
    stroke(255);
    // Color calculated using sine wave
    fill(c);
    ellipse(x,y,w,h);
  }
}

