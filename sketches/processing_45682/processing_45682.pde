
class Bug implements Paintable {
  
  color col;
  PVector pos;
  int size = 10;
  
  Bug(int x, int y, color c, int size) {
    pos = new PVector(x, y);
    col = c;
    this.size = size;
  }
  
  PVector pos() {
    return pos;
  }

  int getSize() {
    return size;
  }  
  
  void setSize(int size) {
    this.size = size;
  }
  
  void doPaint() {
    fill(col);
    ellipseMode(RADIUS);
    ellipse(pos.x, pos.y, size, size);
    fill(255,255,255);
    int eyeSize = size/3;
    ellipse(pos.x - size/3, pos.y - size/3, eyeSize, eyeSize);
    ellipse(pos.x + size/3, pos.y - size/3, eyeSize, eyeSize);
    fill(0,0,0);
    int blackSize = eyeSize/2;
    ellipse(pos.x - size/3 + size/12, pos.y - size/3 + size/12, blackSize, blackSize);
    ellipse(pos.x + size/3 - size/12, pos.y - size/3 + size/12, blackSize, blackSize);
  }
}

