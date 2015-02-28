
class Atom {
  int x;
  int y;
  boolean state;
  
  Atom(int x_, int y_, boolean state_) {
    x = x_;
    y = y_;
    state = state_;
  }
  
  void display() {
    if (state) {
      fill (0);
      stroke(0);
      ellipse (x, y, 3, 3);
    }
  }
  
  void fission () {
    state = false;
    atomLocations[x][y] = false;
  }
}

