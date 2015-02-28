
class Block {
  private int value;

  public Block(int i) {
    value = i;
  }

  public void draw(int x, int w, boolean selected) {
    rectMode(CORNER);
    noStroke();
    int b;
    color c;
    if (selected) {
      b = height-10-value;//10;
      c = color(191, 31, 31);
    } 
    else {
      b = height-10-value;
      c = color(63);
    }
    fill(c);
    rect(x, b, w, value);
  }
  public int value() {
    return value;
  }
  public Block duplicate() {
    return new Block(value);
  }
}

