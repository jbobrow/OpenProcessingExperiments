

class Closet {

  //data
  int xpos, ypos;
  float z;

  Closet ( int x, int y, float z) {
    xpos = x;
    ypos = y; 
     }


  void move() {
    xpos +=160;
    ypos += 80;
  }

  void display() {
    strokeWeight(2);
    //leftdoor
    rect(39, 23, 60, 150);
    //rightdoor
    rect(100, 23, 60, 150);
    //bottom
    rect(39, 180, 120, 120);
  }
}


