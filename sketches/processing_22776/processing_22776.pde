
class Cell {
  int _width, _height;
  boolean isWall = false;

  Cell left = null;
  Cell right = null;
  Cell top = null;
  Cell bottom = null;
  
  Cell(int w, int h) {
    _width = w;
    _height = h;
  }
  void draw(int x, int y) {
    stroke(#303030);
    fill(isWall ? #303030 : #ffc4d9);
    rect(x, y, _width, _height);
  }
  
  boolean pathClear(PVector v) {
    boolean isClear = false;
    if (v.x != 0 && v.y == 0) {
      isClear = !this.isWall
                && this.top != null
                && !this.top.isWall
                && this.bottom != null
                && !this.bottom.isWall;
    } else {
      isClear = !this.isWall
                && this.left != null
                && !this.left.isWall
                && this.right != null
                && !this.right.isWall;
    }
    return isClear;
  }
  
  void setBottom(Cell cell) {
    bottom = cell;
    cell.top = this;
  }
  
  void setLeft(Cell cell) {
    left = cell;
    cell.right = this;
  }
}

