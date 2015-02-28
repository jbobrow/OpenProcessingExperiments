
class Finger {
  private float mx, my;

  public Finger() {
    mx = -100;
    my = -100;
  }

  public void changeLoc(float x_, float y_) {
    mx = x_;
    my = y_;
  }

  public void updateLoc(float x_, float y_) {
    mx += x_;
    my += y_;
  }

  public float getX() {
    return mx;
  }
  public float getY() {
    return my;
  }

  public void drawFinger() {
    noStroke();
    noFill();
    ellipseMode(CENTER);
    ellipse(mx, my, 20, 20);
  }
}


