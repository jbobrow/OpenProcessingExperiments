
class Board {

  void display() {
    for (int x=2; x<400; x+=20) {
      for (int y=2; y<400; y+=20) {
        fill(0);
        rect(x, y, 18, 18);
      }
    }
  }
}


