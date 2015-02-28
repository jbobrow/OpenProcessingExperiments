
class Vector2D {
  
  private float x;
  private float y;

  public Vector2D() {
    x = 0;
    y = 0;
  }

  public Vector2D(float newx, float newy) {
    x = newx;
    y = newy;
  }

  public float getX() {
    return x;
  }

  public float getY() {
    return y;
  }

  public void update(float newx, float newy) {
    x = newx;
    y = newy;
  }

  public void updateX(float newx) {
    x = newx;
  }

  public void updateY(float newy) {
    y = newy;
  }
  
  public void normalize(float magnitude) {
    this.update(this.getX()/magnitude,this.getY()/magnitude);
  }
}


